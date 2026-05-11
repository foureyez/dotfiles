return {
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "svelte", "typescript", "javascript", "xml" },
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	{
		-- This is to detect the helm (yaml) filetypes for helm_ls to attach
		"towolf/vim-helm",
		ft = "helm",
	},
}
