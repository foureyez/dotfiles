local map = vim.keymap

-- Remove default Neovim 0.11+ LSP keymaps we don't want
pcall(vim.keymap.del, "n", "gra")
pcall(vim.keymap.del, "n", "gri")
pcall(vim.keymap.del, "n", "grn")
pcall(vim.keymap.del, "n", "grr")

local function opts(desc)
	return { noremap = true, silent = true, desc = desc }
end

-- Global keymaps (not tied to any plugin)
map.set("t", "<A-ESC>", "<C-\\><C-n>", opts("Exit terminal mode"))
map.set("n", "<leader>n", function()
	vim.o.rnu = not vim.o.rnu
end, opts("Toggle relative line numbers"))
