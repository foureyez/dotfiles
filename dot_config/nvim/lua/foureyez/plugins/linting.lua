return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
			go = { "golangcilint" },
			-- rs = { "clippyrs" }, --Can be added once the parser is coded
		}

		local severities = {
			error = vim.diagnostic.severity.ERROR,
			warning = vim.diagnostic.severity.WARN,
			refactor = vim.diagnostic.severity.INFO,
			convention = vim.diagnostic.severity.HINT,
		}

		lint.linters.clippyrs = {
			name = "clippyrs",
			cmd = "cargo",
			stdin = true, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
			append_fname = true, -- Automatically append the file name to `args` if `stdin = false` (default: true)
			args = {
				"clippy",
				"--no-deps",
				"message-format=json",
			}, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
			stream = "stdout", -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
			ignore_exitcode = false, -- set this to true if the linter exits with a code != 0 and that's considered normal.
			env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
			parser = function(output, bufnr, cwd)
				if output == "" then
					return {}
				end

				local diagnostics = {}
				for line in output:gmatch("[^\r\n]+") do
					local item = vim.json.decode(line)
					if item["message"] == nil then
						return {}
					end
					local curfile = vim.api.nvim_buf_get_name(bufnr)
					local lintedfile = item.target.src_path
					if curfile == lintedfile then
						-- only publish if those are the current file diagnostics
						--
						for _, span in ipairs(item.message.spans) do
							local sv = severities[item.level] or severities.warning
							table.insert(diagnostics, {
								lnum = span.line_start > 0 and span.line_start - 1 or 0,
								col = span.column_start > 0 and span.column_start - 1 or 0,
								end_lnum = span.line_end > 0 and span.line_end - 1 or 0,
								end_col = span.column_end > 0 and span.column_end - 1 or 0,
								severity = sv,
								source = "clippy",
								message = span.label,
							})
						end
					end
				end
				return diagnostics
			end,
		}
		local lint_group = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_group,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
