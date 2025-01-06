local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Disable default nvim's netrw filetree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("lazy").setup({
	{ import = "foureyez.plugins" },
	{ import = "foureyez.plugins.ui" },
	{ import = "foureyez.plugins.coding" },
	{ import = "foureyez.plugins.debugging" },
}, {
	checker = {
		enabled = true,
		notify = true,
	},
	change_detection = {
		notify = true,
	},
})

vim.cmd("colorscheme gruvbox-material")
