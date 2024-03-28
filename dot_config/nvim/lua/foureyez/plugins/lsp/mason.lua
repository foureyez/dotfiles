return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup({
      ensure_installed = {
        "gopls",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "delve",
        "pyright",
        "lua-language-server",
        "ruff",
        "rust-analyzer",
        "svelte-language-server",
        "yaml-language-server",
      },
    })
  end,
}
