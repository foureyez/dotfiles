return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {},
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
				"glsl",
			},
			auto_install = true,
			highlight = {
				enable = true,
				language_tree = true,
				additional_vim_regex_highlighting = false,
				-- disable = function()
				-- 	return vim.b.large_buf
				-- end,
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
		})
	end,
}
