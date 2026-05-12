local M = {}

local defaults = {
  roots = {},
  include_hidden = false,
  recursive = true,
  max_depth = 3,
  root_markers = {},
  picker = {},
  session = {
    enabled = false,
    dir = nil,
  },
  hooks = {
    before_switch = nil,
    after_switch = nil,
  },
}

local config = vim.deepcopy(defaults)
local projects_cache = nil

local function normalize(path)
  return vim.fs.normalize(vim.fn.expand(path))
end

local function has_marker(path)
  if #config.root_markers == 0 then
    return true
  end

  for _, marker in ipairs(config.root_markers) do
    if vim.uv.fs_stat(path .. "/" .. marker) then
      return true
    end
  end

  return false
end

local function run_hook(hook_name, ctx)
  local hook = config.hooks and config.hooks[hook_name]
  if type(hook) ~= "function" then
    return
  end

  local ok, err = pcall(hook, ctx)
  if not ok then
    vim.notify("project_switcher hook error (" .. hook_name .. "): " .. tostring(err), vim.log.levels.ERROR)
  end
end

local function session_dir()
  local configured = config.session and config.session.dir
  if type(configured) == "string" and configured ~= "" then
    return normalize(configured)
  end
  return vim.fn.stdpath("state") .. "/project_sessions"
end

local function session_file_for(path)
  local normalized = normalize(path)
  local escaped = normalized:gsub("[/\\:]", "%%")
  return session_dir() .. "/" .. escaped .. ".vim"
end

local function save_session_for(path)
  if not path or path == "" then
    return
  end

  local normalized = normalize(path)
  if vim.fn.isdirectory(normalized) ~= 1 then
    return
  end

  vim.fn.mkdir(session_dir(), "p")
  vim.cmd("silent! mksession! " .. vim.fn.fnameescape(session_file_for(normalized)))
end

local function path_is_under(path, root)
  if path == root then
    return true
  end
  local root_prefix = root
  if root_prefix:sub(-1) ~= "/" then
    root_prefix = root_prefix .. "/"
  end
  return path:sub(1, #root_prefix) == root_prefix
end

local function has_project_buffers(project_root)
  for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
    if buf.name ~= "" then
      local buf_path = normalize(buf.name)
      if path_is_under(buf_path, project_root) then
        return true
      end
    end
  end
  return false
end

local function load_session_for(path)
  if not path or path == "" then
    return
  end

  local normalized = normalize(path)
  local session_file = session_file_for(normalized)
  if vim.fn.filereadable(session_file) == 1 then
    vim.cmd("silent! source " .. vim.fn.fnameescape(session_file))
  end

  if not has_project_buffers(normalized) then
    vim.cmd("silent! %bwipeout!")
    vim.cmd("enew")
  end
end

local function pad_right(text, width)
  local delta = width - vim.fn.strdisplaywidth(text)
  if delta <= 0 then
    return text
  end
  return text .. string.rep(" ", delta)
end

local function pad_left(text, width)
  local delta = width - vim.fn.strdisplaywidth(text)
  if delta <= 0 then
    return text
  end
  return string.rep(" ", delta) .. text
end

local function truncate_left(text, max_width)
  if max_width <= 0 then
    return ""
  end
  if vim.fn.strdisplaywidth(text) <= max_width then
    return text
  end
  if max_width == 1 then
    return "…"
  end

  local char_count = vim.fn.strchars(text)
  local keep = max_width - 1
  for start_char = char_count - 1, 0, -1 do
    local tail = vim.fn.strcharpart(text, start_char)
    if vim.fn.strdisplaywidth(tail) > keep then
      return "…" .. vim.fn.strcharpart(text, start_char + 1)
    end
  end
  return "…" .. text
end

local function picker_content_width()
  local win_width = config.picker and config.picker.winopts and config.picker.winopts.width
  local columns = vim.o.columns
  if type(win_width) == "number" then
    if win_width > 0 and win_width <= 1 then
      return math.floor(columns * win_width)
    end
    if win_width > 1 then
      return math.floor(win_width)
    end
  end
  return math.floor(columns * 0.8)
end

local function scan_projects()
  local projects = {}
  local seen = {}

  local function add_project(path, root)
    if seen[path] then
      return
    end
    seen[path] = true
    table.insert(projects, {
      name = vim.fs.basename(path),
      path = path,
      root = root,
    })
  end

  local function scan_dir(dir, root, depth)
    if depth > config.max_depth then
      return
    end

    for name, entry_type in vim.fs.dir(dir) do
      if entry_type == "directory" then
        local hidden = name:sub(1, 1) == "."
        if config.include_hidden or not hidden then
          local path = dir .. "/" .. name
          if has_marker(path) then
            add_project(path, root)
          elseif config.recursive then
            scan_dir(path, root, depth + 1)
          end
        end
      end
    end
  end

  for _, root in ipairs(config.roots) do
    local expanded_root = normalize(root)
    if vim.fn.isdirectory(expanded_root) == 1 then
      if has_marker(expanded_root) then
        add_project(expanded_root, expanded_root)
      else
        scan_dir(expanded_root, expanded_root, 1)
      end
    end
  end

  table.sort(projects, function(a, b)
    if a.name == b.name then
      return a.path < b.path
    end
    return a.name < b.name
  end)

  return projects
end

local function ensure_projects_cache()
  if projects_cache == nil then
    projects_cache = scan_projects()
  end
  return projects_cache
end

function M.discover_projects()
  return ensure_projects_cache()
end

function M.refresh_projects()
  projects_cache = scan_projects()
  return projects_cache
end

function M.switch(project_path)
  if not project_path or project_path == "" then
    return
  end

  local target = normalize(project_path)
  if vim.fn.isdirectory(target) ~= 1 then
    vim.notify("project_switcher: invalid directory: " .. target, vim.log.levels.ERROR)
    return
  end

  local from = vim.fn.getcwd()
  local ctx = { from = from, to = target }

  run_hook("before_switch", ctx)
  if config.session and config.session.enabled then
    save_session_for(from)
  end
  vim.cmd("cd " .. vim.fn.fnameescape(target))
  if config.session and config.session.enabled then
    load_session_for(target)
  end
  run_hook("after_switch", ctx)

  vim.notify("Switched project to " .. target, vim.log.levels.INFO)
end

function M.pick()
  local projects = ensure_projects_cache()
  if #projects == 0 then
    vim.notify("project_switcher: no projects found", vim.log.levels.WARN)
    return
  end

  local max_name_width = 0
  for _, project in ipairs(projects) do
    max_name_width = math.max(max_name_width, vim.fn.strdisplaywidth(project.name))
  end

  local separator = "  "
  local chrome_padding = 6
  local content_width = math.max(20, picker_content_width() - chrome_padding)
  local path_col_width = math.max(1, content_width - max_name_width - vim.fn.strdisplaywidth(separator))

  local lines = {}
  for _, project in ipairs(projects) do
    local name_col = "\27[1m" .. pad_right(project.name, max_name_width) .. "\27[0m"
    local clipped_path = truncate_left(project.path, path_col_width)
    local path_col = pad_left(clipped_path, path_col_width)
    local line = string.format("%s\t%s\t%s", name_col, path_col, project.path)
    table.insert(lines, line)
  end

  local picker_opts = vim.tbl_deep_extend("force", {
    prompt = "Projects> ",
    fzf_opts = {
      ["--ansi"] = "",
      ["--delimiter"] = "\t",
      ["--with-nth"] = "1,2",
    },
    actions = {
      ["default"] = function(selected)
        if not selected or #selected == 0 then
          return
        end
        local fields = vim.split(selected[1], "\t", { plain = true })
        local selected_path = fields[3]
        if not selected_path or selected_path == "" then
          return
        end
        M.switch(selected_path)
      end,
    },
  }, config.picker or {})

  require("fzf-lua").fzf_exec(lines, picker_opts)
end

function M.setup(opts)
  config = vim.tbl_deep_extend("force", vim.deepcopy(defaults), opts or {})
  projects_cache = nil

  vim.api.nvim_create_user_command("ProjectSwitch", function(params)
    if params.args == "" then
      M.pick()
    else
      M.switch(params.args)
    end
  end, {
    nargs = "?",
    complete = function(arglead)
      local items = {}
      for _, project in ipairs(ensure_projects_cache()) do
        if arglead == "" or project.path:find(arglead, 1, true) then
          table.insert(items, project.path)
        end
      end
      return items
    end,
  })

  local function discover_command()
    local refreshed = M.refresh_projects()
    vim.notify("project_switcher: refreshed " .. #refreshed .. " projects", vim.log.levels.INFO)
  end
  vim.api.nvim_create_user_command("ProjectDiscover", discover_command, {})
end

return M
