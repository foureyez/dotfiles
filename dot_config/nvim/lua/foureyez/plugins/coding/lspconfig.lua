-- Server configs: keys are server names, values are server-specific settings.
-- Servers with no custom settings only need to be listed in the `servers` table
-- with an empty table `{}`. To add a new server, just add a line here.
local servers = {
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				check = { command = "clippy" },
				cargo = {
					extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
					extraArgs = { "--profile", "rust-analyzer" },
				},
			},
		},
	},
	gopls = {
		settings = {
			gopls = {
				gofumpt = true,
				codelenses = {
					test = true,
					tidy = true,
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
		init_options = { usePlaceholders = true },
	},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	},
	helm_ls = {
		settings = {
			["helm-ls"] = {
				yamlls = { path = "yaml-language-server" },
			},
		},
	},
	bashls = {},
	ols = {},
	glsl_analyzer = {},
	terraformls = {},
	svelte = {},
	tailwindcss = {},
	clangd = {},
	protols = {},
}

return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			diagnostics = {
				virtual_text = false, -- False so that inline diagnostics plugin will create its own virtual text
			},
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

			vim.diagnostic.config(opts.diagnostics)

			local on_attach = function(_, bufnr)
				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr, desc = desc })
				end

				map("n", "gr", "<cmd>FzfLua lsp_references<CR>", "Show LSP references")
				map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
				map("n", "gd", vim.lsp.buf.definition, "Show LSP definitions")
				map("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", "Show LSP implementations")
				map("n", "gt", "<cmd>FzfLua lsp_type_definitions<CR>", "Show LSP type definitions")
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "See available code actions")
				map("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename")
				map("n", "<leader>dd", "<cmd>FzfLua diagnostics_document<CR>", "Show buffer diagnostics")
				map("n", "<leader>dK", vim.diagnostic.open_float, "Show line diagnostics")
				map("n", "<leader>dk", function() vim.diagnostic.jump({ count = -1 }) end, "Go to previous diagnostic")
				map("n", "<leader>dj", function() vim.diagnostic.jump({ count = 1 }) end, "Go to next diagnostic")
				map("n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor")
				map("n", "<leader>rs", ":LspRestart<CR>", "Restart LSP")
			end

			-- Configure and enable all servers from the table
			for name, server_opts in pairs(servers) do
				vim.lsp.config(name, vim.tbl_deep_extend("force", {
					on_attach = on_attach,
					capabilities = capabilities,
				}, server_opts))
			end
			vim.lsp.enable(vim.tbl_keys(servers))

			-- LSP progress notifications
			local progress = vim.defaulttable()
			vim.api.nvim_create_autocmd("LspProgress", {
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
					if not client or type(value) ~= "table" then
						return
					end
					if value.kind == "report" then
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
							notif.icon = #progress[client.id] == 0 and " "
								or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
						end,
					})
				end,
			})

			-- Go: organize imports + format on save
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
