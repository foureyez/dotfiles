-- return {
-- 	"navarasu/onedark.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("onedark").setup({
-- 			style = "darker",
-- 		})
-- 		require("onedark").load()
-- 	end,
-- }
-- return {
-- 	"scottmckendry/cyberdream.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("cyberdream").setup({
-- 			-- Recommended - see "Configuring" below for more config options
-- 			transparent = true,
-- 			italic_comments = true,
-- 			hide_fillchars = true,
-- 			borderless_telescope = true,
-- 			terminal_colors = true,
-- 		})
-- 		vim.cmd("colorscheme cyberdream") -- set the colorscheme
-- 	end,
-- }
-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		vim.cmd("colorscheme tokyonight-moon")
-- 	end,
-- }
return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd("colorscheme kanagawa")
  end,
}
-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
-- }
