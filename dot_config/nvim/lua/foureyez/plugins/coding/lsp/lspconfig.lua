return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	opts = {
		diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "●",
			},
		},
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()
		local lspconfig = require("lspconfig")

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr
			opts.desc = "Show LSP references"
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			vim.keymap.set("n", "<leader>dk", vim.diagnostic.jump, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

			if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
				local semantic = client.config.capabilities.textDocument.semanticTokens
				client.server_capabilities.semanticTokensProvider = {
					full = true,
					legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
					range = true,
				}
			end
		end

		-- Configure LSP for rust
		lspconfig.rust_analyzer.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					check = {
						command = "clippy",
					},
					cargo = {
						extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
						extraArgs = { "--profile", "rust-analyzer" },
					},
				},
			},
		})

		-- Configure LSP for golang
		lspconfig.gopls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				gopls = {
					gofumpt = true,
					codelenses = {
						gc_details = false,
						generate = true,
						regenerate_cgo = true,
						-- run_govulncheck = true,
						test = true,
						tidy = true,
						upgrade_dependency = true,
						vendor = true,
					},
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					analyses = {
						fieldalignment = true,
						nilness = true,
						shadow = true,
						unusedparams = true,
						unusedwrite = true,
						useany = true,
						fillstruct = true,
					},
					staticcheck = true,
					directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
					semanticTokens = true,
				},
			},
			init_options = {
				usePlaceholders = true,
			},
		})

		-- Configure LSP for lua
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig.bashls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.svelte.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.tailwindcss.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.helm_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				["helm-ls"] = {
					yamlls = {
						path = "yaml-language-server",
					},
				},
			},
		})

		lspconfig.ols.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
}
