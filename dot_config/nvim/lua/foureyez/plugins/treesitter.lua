return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			ensure_installed = {
				"markdown_inline",
				"markdown",
				"lua",
				"go",
				"vim",
				"vimdoc",
				"query",
				"bash",
				"yaml",
				"toml",
				"json",
				"norg",
				"typescript",
				"css",
				"svelte",
				"rust",
			},
			highlight = {
				enable = true,
			},
			auto_install = true,
		})
	end,
}
