return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local mason = require("mason")
			mason.setup()

			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {
					"gopls",
					"lua-language-server",
					"ansible-language-server",
					"typescript-language-server",
					"tailwindcss-language-server",
					"bash-language-server",
					"rust-analyzer",
					"svelte-language-server",
					-- "yaml-language-server",
					"helm-ls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = {
					"djlint",
					"prettierd",
					"gofumpt",
					"rustfmt",
					"goimports-reviser",
					"gomodifytags",
					"stylua", --lua formatter
					"impl", --golang generate method stubs for implementing interface
					"black", --python formatter
					"golangci-lint",
					"pyright", --python linter
					"ruff", --python linter and code formatter written in rust
					"delve",
				},
			})
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				automatic_installation = true,
			})
		end,
	},
}
