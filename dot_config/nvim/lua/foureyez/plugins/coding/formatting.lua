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
				html = { "prettierd" },
				go = {
					"gofumpt",
					"goimports-reviser", --[[ "golines"  ]]
				},
				rs = { "rustfmt" },
				formatters_by_ft = {
					odin = { "odinfmt" },
				},
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters = {
				-- djlint = {
				-- 	prepend_args = {
				-- 		"--indent",
				-- 		"2",
				-- 		"--profile",
				-- 		"golang",
				-- 		"--blank-line-before-tag",
				-- 		"body",
				-- 		"--format-attribute-template-tags",
				-- 	},
				-- This is not working, not able to find the specified rc file. Check later
				-- prepend_args = { "--configuration", "~/.config/nvim/.djlintrc" },
				-- },
				-- Prettierd not able to resolve any other global plugin
				-- Use different formattters
				-- prettierd = {
				-- 	env = {
				-- 		PRETTIERD_DEFAULT_CONFIG = "~/.config/nvim/.prettierrc.json",
				-- 	},
				-- },
				prettier = {
					-- 	prepend_args = {
					-- 		"--plugin",
					-- 		vim.fn.expand(
					-- 			"~/.local/share/nvim/mason/packages/prettier/node_modules/prettier-plugin-go-template/lib/index.js"
					-- 		),
					-- 	},
					-- 	options = {
					-- 		ft_parsers = {
					-- 			html = "go-template",
					-- 		},
					-- 	},
				},
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
