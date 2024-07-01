return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"RRethy/nvim-treesitter-textsubjects",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"markdown",
				"lua",
				"go",
				"gowork",
				"gomod",
				"gosum",
				"bash",
				"yaml",
				"toml",
				"html",
				"json",
				"typescript",
				"css",
				"svelte",
				"rust",
				"odin",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
				disable = { "yaml", "python" },
			},
			-- incremental_selection = {
			-- 	enable = true,
			-- 	keymaps = {
			-- 		init_selection = "<C-v>",
			-- 		node_incremental = "<C-v>",
			-- 		node_decremental = "<C-V>",
			-- 		scope_incremental = false,
			-- 	},
			-- },

			textobjects = {
				select = {
					enable = true,
					-- automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- you can use the capture groups defined in textobjects.scm
						["aa"] = "@assignment.outer",
						["ia"] = "@assignment.inner",
						["la"] = "@assignment.lhs",
						["ra"] = "@assignment.rhs",

						["af"] = "@function.outer",
						["if"] = "@function.inner",

						["ac"] = "@class.outer",
						["ic"] = { query = "@class.inner", desc = "select inner part of a class region" },

						["ib"] = "@block.inner",
						["ab"] = "@block.outer",
					},
					-- you can choose the select mode (default is charwise 'v')
					--
					-- can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * method: eg 'v' or 'o'
					-- and should return the mode ('v', 'v', or '<c-v>') or a table
					-- mapping query_strings to modes.
					-- selection_modes = {
					--   ["@parameter.outer"] = "v", -- charwise
					--   ["@function.outer"] = "v", -- linewise
					--   ["@class.outer"] = "<c-v>", -- blockwise
					-- },
					-- -- if you set this to `true` (default is `false`) then any textobject is
					-- extended to include preceding or succeeding whitespace. succeeding
					-- whitespace has priority in order to act similarly to eg the built-in
					-- `ap`.
					--
					-- can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * selection_mode: eg 'v'
					-- and should return true of false
				},
				move = {
					enable = true,
					goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
					goto_nextf_end = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
					goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
					goto_previous_end = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
				},
			},
			textsubjects = {
				enable = true,
				prev_selection = ",", -- (Optional) keymap to select the previous selection
				keymaps = {
					["."] = "textsubjects-smart",
					[";"] = "textsubjects-container-outer",
					["i;"] = "textsubjects-container-inner",
				},
			},
		})
	end,
}
