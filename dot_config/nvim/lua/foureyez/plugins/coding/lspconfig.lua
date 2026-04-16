return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		opts = {
			multilines = {
				enabled = true,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- "hrsh7th/cmp-nvim-lsp",
		},
		opts = {
			diagnostics = {
				-- underline = true,
				-- update_in_insert = false,
				virtual_text = false, -- False so that inline diagostics plugin will create its own virtual text(avoids conflict)
			},
			-- Global capabilities
			capabilities = {
				workspace = {
					fileOperations = {
						didRename = true,
						willRename = true,
					},
				},
			},
		},
		config = function(_, opts)
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				require("blink.cmp").get_lsp_capabilities(opts.capabilities),
				opts.capabilities or {}
			)

			-- Apply diagnostics config from opts
			vim.diagnostic.config(opts.diagnostics)

			local keymap_opts = { noremap = true, silent = true }
			local on_attach = function(client, bufnr)
				keymap_opts.buffer = bufnr
				keymap_opts.desc = "Show LSP references"
				vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", keymap_opts)

				keymap_opts.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymap_opts)

				keymap_opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)

				keymap_opts.desc = "Show LSP implementations"
				vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", keymap_opts)

				keymap_opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "gt", "<cmd>FzfLua lsp_type_definitions<CR>", keymap_opts)

				keymap_opts.desc = "See available code actions"
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, keymap_opts)

				keymap_opts.desc = "Smart rename"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, keymap_opts)

				keymap_opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "<leader>dd", "<cmd>FzfLua diagnostics_document<CR>", keymap_opts)

				keymap_opts.desc = "Show line diagnostics"
				vim.keymap.set("n", "<leader>dK", vim.diagnostic.open_float, keymap_opts)

				keymap_opts.desc = "Go to previous diagnostic"
				vim.keymap.set("n", "<leader>dk", function()
					vim.diagnostic.jump({ count = -1 })
				end, keymap_opts)

				keymap_opts.desc = "Go to next diagnostic"
				vim.keymap.set("n", "<leader>dj", function()
					vim.diagnostic.jump({ count = 1 })
				end, keymap_opts)

				keymap_opts.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)

				keymap_opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", keymap_opts)

				-- gopls specific
				-- if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
				-- 	local semantic = client.config.capabilities.textDocument.semanticTokens
				-- 	client.server_capabilities.semanticTokensProvider = {
				-- 		full = true,
				-- 		legend = {
				-- 			tokenTypes = semantic.tokenTypes,
				-- 			tokenModifiers = semantic.tokenModifiers,
				-- 		},
				-- 		range = true,
				-- 	}
				-- end
			end

			-- Configure LSP for rust
			vim.lsp.config("rust_analyzer", {
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
			vim.lsp.config("gopls", {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					gopls = {
						gofumpt = true,
						codelenses = {
							-- gc_details = false,
							-- generate = true,
							-- regenerate_cgo = true,
							-- run_govulncheck = true,
							test = true,
							tidy = true,
							-- upgrade_dependency = true,
							-- vendor = true,
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
							-- fieldalignment = true,
							nilness = true,
							shadow = true,
							unusedparams = true,
							unusedwrite = true,
							useany = true,
							fillstruct = true,
						},
						usePlaceholders = true,
						completeUnimported = true,
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
			vim.lsp.config("lua_ls", {
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
						-- personal_workspace,
					},
				},
			})

			vim.lsp.config("bashls", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.lsp.config("helm_ls", {
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

			vim.lsp.config("ols", {
				-- cmd = { "/home/foureyez/workspace/ols/ols" },
				on_attach = on_attach,
				capabilities = capabilities,
				-- root_dir = { "~/personal_workspace/ols" },
				-- root_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h"),
			})

			vim.lsp.config("glsl_analyzer", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.lsp.config("terraformls", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.lsp.config("svelte", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.lsp.config("tailwindcss", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.lsp.config("clangd", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.lsp.config("protols", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("gopls")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("bashls")
			vim.lsp.enable("helm_ls")
			vim.lsp.enable("ols")
			vim.lsp.enable("glsl_analyzer")
			vim.lsp.enable("terraformls")
			vim.lsp.enable("svelte")
			vim.lsp.enable("tailwindcss")
			vim.lsp.enable("clangd")
			vim.lsp.enable("protols")

			-- Autocmd for tracking and displaying lsp progress as notification
			local progress = vim.defaulttable()
			vim.api.nvim_create_autocmd("LspProgress", {
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
					if not client or type(value) ~= "table" then
						return
					end
					local p = progress[client.id]

					for i = 1, #p + 1 do
						if i == #p + 1 or p[i].token == ev.data.params.token then
							p[i] = {
								token = ev.data.params.token,
								msg = ("[%3d%%] %s%s"):format(
									value.kind == "end" and 100 or value.percentage or 100,
									value.title or "",
									value.message and (" **%s**"):format(value.message) or ""
								),
								done = value.kind == "end",
							}
							break
						end
					end

					local msg = {} ---@type string[]
					progress[client.id] = vim.tbl_filter(function(v)
						return table.insert(msg, v.msg) or not v.done
					end, p)

					local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
					vim.notify(table.concat(msg, "\n"), "info", {
						id = "lsp_progress",
						title = client.name,
						opts = function(notif)
							notif.icon = #progress[client.id] == 0 and " "
								or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
						end,
					})
				end,
			})

			-- Autocmd for resolving go imports on file save
			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				pattern = "*.go",
				callback = function()
					local clients = vim.lsp.get_clients({ bufnr = 0, name = "gopls" })
					if #clients == 0 then
						return
					end
					local client = clients[1]
					local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
					params.context = { only = { "source.organizeImports" } }
					-- buf_request_sync defaults to a 1000ms timeout. Depending on your
					-- machine and codebase, you may want longer. Add an additional
					-- argument after params if you find that you have to write the file
					-- twice for changes to be saved.
					-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
					local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
					for cid, res in pairs(result or {}) do
						for _, r in pairs(res.result or {}) do
							if r.edit then
								local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
								vim.lsp.util.apply_workspace_edit(r.edit, enc)
							end
						end
					end
					vim.lsp.buf.format({ async = false })
				end,
			})
		end,
	},
}
