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
				-- yaml = { "prettierd" },
				css = { "prettierd" },
				markdown = { "prettierd" },
				html = { "djlint" },
				go = {
					"gofumpt",
					"goimports-reviser", --[[ "golines"  ]]
				},
				rs = { "rustfmt" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters = {
				djlint = {
					prepend_args = { "--indent", "2" },
					-- This is not working, not able to find the specified rc file. Check later
					-- prepend_args = { "--configuration", "~/.config/nvim/.djlintrc" },
				},
				-- Prettierd not able to resolve any other global plugin
				-- Use different formattters
				-- prettierd = {
				-- 	env = {
				-- 		PRETTIERD_DEFAULT_CONFIG = "~/.config/nvim/.prettierrc.json",
				-- 	},
				-- },
			},
		})
	end,
}
