return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'main',
  build = ":TSUpdate",
  lazy = false,
  dependencies = {},
  config = function()
    local ts = require("nvim-treesitter")
    ts.install {
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
      "xml",
      "zsh",
    }
  end,
}
