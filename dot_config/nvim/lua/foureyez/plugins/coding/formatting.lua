return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				json = { "prettierd" },
				toml = { "prettierd" },
				-- yaml = { "prettierd" },
				css = { "prettierd" },
				markdown = { "prettierd" },
				html = { "prettierd" },
				-- go formatting handled by lspconfig BufWritePre autocmd (organizeImports + format)
				-- proto = { "protols" }, --Default formatting not inline with work files, disabling
				rust = { "rustfmt" },
				odin = { "odinfmt" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters = {
				odinfmt = {
					-- Change where to find the command if it isn't in your path.
					command = "odinfmt",
					args = { "-stdin" },
					stdin = true,
				},
			},
		})
	end,
}
