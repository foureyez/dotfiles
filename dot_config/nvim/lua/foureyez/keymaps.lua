local map = vim.keymap

local float_term_opts = {
	direction = "float",
	hidden = true,
}

-- Remove suboptimal keymaps
pcall(vim.keymap.del, "n", "gra")
pcall(vim.keymap.del, "n", "gri")
pcall(vim.keymap.del, "n", "grn")
pcall(vim.keymap.del, "n", "grr")

local function opts(desc)
	return { noremap = true, silent = true, desc = desc }
end

-- General keymaps
map.set("t", "<A-ESC>", "<C-\\><C-n>", opts("Exit terminal mode"))
map.set("n", "<C-j>", ":FzfLua files<cr>", opts("FzfLua files"))
map.set("n", "<leader>tt", ":FzfLua files<cr>", opts("FzfLua files"))
map.set("n", "<C-k>", "kkkkk", opts("Move up 5 lines"))
map.set("n", "<leader>n", function()
	vim.o.rnu = not vim.o.rnu
end, opts("Toggle relative line numbers"))

-- Terminal keymaps
map.set("n", "<leader>l", function()
	local terminal = require("toggleterm.terminal").Terminal
	terminal:new(vim.tbl_deep_extend("force", float_term_opts, { cmd = "lazygit", dir = vim.fn.getcwd() })):toggle()
end, opts("Open lazygit"))
map.set("n", "<leader>g", function()
	local terminal = require("toggleterm.terminal").Terminal
	terminal:new(vim.tbl_deep_extend("force", float_term_opts, { cmd = "gitui", dir = vim.fn.getcwd() })):toggle()
end, opts("Open gitui"))
map.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts("Float terminal"))

-- Mgmt Keymaps
map.set("n", "<leader>;", "<cmd>NeovimProjectDiscover<CR>", opts("Discover projects"))
-- map.set("n", "<leader>w", "<cmd>Oil --float<CR>", opts("Oil float"))

map.set("n", "<leader>db", "<cmd>FzfLua dap_breakpoints<CR>", opts("List breakpoints"))
map.set("n", "<leader>/", "<cmd>FzfLua live_grep<CR>", opts("Live grep"))
map.set("n", "<leader>f", "<cmd>FzfLua files winopts.width=0.5 winopts.preview.hidden=yes<CR>", opts("Find files"))
map.set("n", "<leader>dl", "<cmd>FzfLua diagnostics_workspace<CR>", opts("Workspace diagnostics"))

-- Debugging Keymaps
map.set("n", "<leader>b", "<cmd>PBToggleBreakpoint<cr>", opts("Toggle breakpoint"))
map.set("n", "<leader>dc", "<cmd>PBClearAllBreakpoints<cr>", opts("Clear all breakpoints"))
map.set("n", "<F3>", function()
	require("dap").step_over()
end, opts("DAP step over"))
map.set("n", "<F2>", function()
	require("dap").step_into()
end, opts("DAP step into"))
map.set("n", "<F4>", function()
	require("dap").step_out()
end, opts("DAP step out"))
map.set("n", "<F5>", function()
	require("dap").continue()
end, opts("DAP continue"))
map.set("n", "<leader>dr", function()
	require("dap").run_to_cursor()
end, opts("DAP run to cursor"))
map.set("n", "<leader>?", function()
	require("dapui").eval(nil, { enter = true })
end, opts("DAP eval under cursor"))

-- Obsidian Keymaps
map.set("n", "<leader>oc", "<cmd>ObsidianToggleCheckbox<CR>", opts("Obsidian toggle checkbox"))
map.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", opts("Obsidian new note"))
map.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", opts("Obsidian search"))
map.set("n", "<leader>ot", "<cmd>ObsidianToday<CR>", opts("Obsidian today"))
map.set("n", "<leader>ott", "<cmd>ObsidianTomorrow<CR>", opts("Obsidian tomorrow"))
map.set("n", "<leader>ow", "<cmd>ObsidianWorkspace<CR>", opts("Obsidian workspace"))
map.set("n", "<leader>oy", "<cmd>ObsidianYesterday<CR>", opts("Obsidian yesterday"))

map.set("n", "<leader>a", function()
	require("aerial").snacks_picker({
		layout = {
			preset = "dropdown",
			preview = false,
		},
	})
end, opts("Aerial symbol picker"))
