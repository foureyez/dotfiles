local defaults = { noremap = true, silent = true }
local map = vim.keymap

local terminal = require("toggleterm.terminal").Terminal
local float_term_opts = {
	direction = "float",
	hidden = true,
}

-- Remove suboptimal keymaps
pcall(vim.keymap.del, "n", "gra")
pcall(vim.keymap.del, "n", "gri")
pcall(vim.keymap.del, "n", "grn")
pcall(vim.keymap.del, "n", "grr")

-- General keymaps
map.set("t", "<A-ESC>", "<C-\\><C-n>", defaults) -- To exit out of terminal
map.set("n", "<C-j>", ":FzfLua files<cr>", defaults)
map.set("n", "<leader>tt", ":FzfLua files<cr>", defaults)
map.set("n", "<C-k>", "kkkkk", defaults)
map.set("n", "<leader>n", function()
	vim.o.rnu = not vim.o.rnu
end, defaults)

-- Terminal keymaps
map.set("n", "<leader>l", function()
	terminal:new(vim.tbl_deep_extend("force", float_term_opts, { cmd = "lazygit", dir = vim.fn.getcwd() })):toggle()
end, defaults)
map.set("n", "<leader>g", function()
	terminal:new(vim.tbl_deep_extend("force", float_term_opts, { cmd = "gitui", dir = vim.fn.getcwd() })):toggle()
end, defaults)
map.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", defaults)

-- Mgmt Keymaps
map.set("n", "<leader>;", "<cmd>NeovimProjectDiscover<CR>", defaults)
map.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", defaults)
-- map.set("n", "<leader>w", "<cmd>Oil --float<CR>", defaults)

map.set("n", "<leader>db", "<cmd>FzfLua dap_breakpoints<CR>", defaults)
map.set("n", "<leader>/", "<cmd>FzfLua live_grep<CR>", defaults)
map.set("n", "<leader>f", "<cmd>FzfLua files winopts.width=0.5 winopts.preview.hidden=yes<CR>", defaults)
map.set("n", "<leader>dl", "<cmd>FzfLua diagnostics_workspace<CR>", defaults)

-- Debugging Keymaps
local dap = require("dap")
map.set("n", "<leader>b", "<cmd>PBToggleBreakpoint<cr>", defaults)
map.set("n", "<leader>b", "<cmd>PBToggleBreakpoint<cr>", defaults)
map.set("n", "<leader>dc", "<cmd>PBClearAllBreakpoints<cr>", defaults)
map.set("n", "<F3>", dap.step_over, defaults)
map.set("n", "<F2>", dap.step_into, defaults)
map.set("n", "<F4>", dap.step_out, defaults)
map.set("n", "<F5>", dap.continue, defaults)
map.set("n", "<leader>dr", dap.run_to_cursor, defaults)
map.set("n", "<leader>?", function()
	require("dapui").eval(nil, { enter = true })
end, defaults)

-- Obsidian Keymaps
map.set("n", "<leader>oc", "<cmd>ObsidianToggleCheckbox<CR>", defaults)
map.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", defaults)
map.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", defaults)
map.set("n", "<leader>ot", "<cmd>ObsidianToday<CR>", defaults)
map.set("n", "<leader>ott", "<cmd>ObsidianTomorrow<CR>", defaults)
map.set("n", "<leader>ow", "<cmd>ObsidianWorkspace<CR>", defaults)
map.set("n", "<leader>oy", "<cmd>ObsidianYesterday<CR>", defaults)

map.set("n", "<leader>a", function()
	require("aerial").snacks_picker({
		layout = {
			preset = "dropdown",
			preview = false,
		},
	})
end, defaults)
