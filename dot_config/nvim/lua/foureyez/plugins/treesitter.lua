return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      ensure_installed = {
        "markdown_inline",
        "markdown",
        "lua",
        "go",
        "gowork",
        "gomod",
        "gosum",
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
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-v>",
          node_incremental = "<C-v>",
          node_decremental = "<C-V>",
          scope_incremental = false,
        },
      },
    })
  end,
}
