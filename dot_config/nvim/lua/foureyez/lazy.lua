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
	{ import = "foureyez.plugins.utils" },
	{ import = "foureyez.plugins.coding" },
	{ import = "foureyez.plugins.lsp" },
	{ import = "foureyez.plugins.notetaking" },
	{ import = "foureyez.plugins.debugging" },
	{ import = "foureyez.plugins.git" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
