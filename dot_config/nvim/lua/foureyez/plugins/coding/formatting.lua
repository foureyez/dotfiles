return {
	"stevearc/conform.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
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
				yaml = { "prettierd" },
				css = { "prettierd" },
				markdown = { "prettierd" },
				html = { "prettierd" },
				go = { "gofumpt", "goimports-reviser", "golines" },
				rs = { "rustfmt" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
