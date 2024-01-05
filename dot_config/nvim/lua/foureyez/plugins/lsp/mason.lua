return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup({
			ensure_installed = {
				"gopls",
				"pyright",
				"lua-language-server",
				"ruff",
				"rust-analyzer",
				"svelte-language-server",
			},
		})
	end,
}
