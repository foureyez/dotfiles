local defaults = { noremap = true, silent = true }
local map = vim.keymap

local terminal = require("toggleterm.terminal").Terminal
local float_term_opts = {
	direction = "float",
	hidden = true,
}

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
map.set("n", "<leader>e", "<cmd>Oil --float<CR>", defaults)

map.set("n", "<leader>bl", "<cmd>FzfLua dap_breakpoints<CR>", defaults)
map.set("n", "<leader>/", "<cmd>FzfLua live_grep<CR>", defaults)
map.set("n", "<leader>f", "<cmd>FzfLua files winopts.width=0.5 winopts.preview.hidden=yes<CR>", defaults)
map.set("n", "<leader>dl", "<cmd>FzfLua diagnostics_workspace<CR>", defaults)

-- Debugging Keymaps
map.set("n", "<leader>b", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", defaults)
map.set("n", "<leader>bc", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", defaults)
map.set("n", "F3", function()
	require("dap").step_over()
end, defaults)
map.set("n", "F2", function()
	require("dap").step_into()
end, defaults)
map.set("n", "F4", function()
	require("dap").step_out()
end, defaults)
map.set("n", "F5", function()
	require("dap").continue()
end, defaults)

-- Git Keymaps
map.set("n", "<leader>gb", "<cmd>Gitsigns blame<cr>", defaults)
map.set("n", "<leader>gbl", "<cmd>Gitsigns blame_line<cr>", defaults)

-- Obsidian Keymaps
map.set("n", "<leader>oc", "<cmd>ObsidianToggleCheckbox<CR>", defaults)
map.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", defaults)
map.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", defaults)
map.set("n", "<leader>ot", "<cmd>ObsidianToday<CR>", defaults)
map.set("n", "<leader>ott", "<cmd>ObsidianTomorrow<CR>", defaults)
map.set("n", "<leader>ow", "<cmd>ObsidianWorkspace<CR>", defaults)
map.set("n", "<leader>oy", "<cmd>ObsidianYesterday<CR>", defaults)
