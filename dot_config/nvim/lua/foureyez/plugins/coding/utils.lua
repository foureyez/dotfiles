return {
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	-- {
	-- 	"RRethy/vim-illuminate",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function()
	-- 		require("illuminate").configure({
	-- 			providers = {
	-- 				"lsp",
	-- 				"treesitter",
	-- 				-- "regex",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- quite slow for large files, do i need this?
	{
		-- This is to detect the helm (yaml) filetypes for helm_ls to attach
		"towolf/vim-helm",
		ft = "helm",
	},
	-- {
	-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- 	lazy = true,
	-- 	event = "LspAttach",
	-- 	config = function()
	-- 		require("lsp_lines").setup()
	-- 	end,
	-- },
	-- {
	-- 	"m4xshen/hardtime.nvim",
	-- 	lazy = false,
	-- 	dependencies = { "MunifTanjim/nui.nvim" },
	-- 	opts = {},
	-- },
}
