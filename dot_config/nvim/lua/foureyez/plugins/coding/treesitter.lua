return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
  lazy = false,
	dependencies = {},
	config = function()
		local ts = require("nvim-treesitter")
    ts.install{
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
				"rust",
				"odin",
				"glsl",
        "helm",
			}
	end,
}
