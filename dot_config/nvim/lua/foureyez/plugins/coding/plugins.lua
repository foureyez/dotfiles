return {
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			bind = true,
			handler_opts = {
				border = "none",
			},
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	{
		"kylechui/nvim-surround",
		-- version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = true,
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		-- This is to detect the helm (yaml) filetypes for helm_ls to attach
		"towolf/vim-helm",
		ft = "helm",
	},
}
