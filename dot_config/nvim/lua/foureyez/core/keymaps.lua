-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.api.nvim_set_keymap("t", "<A-ESC>", "<C-\\><C-n>", { noremap = true })
