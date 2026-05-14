return {
  "stevearc/aerial.nvim",
  event = "LspAttach",
  keys = {
    {
      "<leader>a",
      function()
        require("aerial").fzf_lua_picker({
          profile = 'default-title',
        })
      end,
      desc = "Aerial symbols",
    },
  },
  opts = {},
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup({
      attach_mode = "window",
      manage_check_interval = 500,
      on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, noremap = true, silent = true })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, noremap = true, silent = true })
      end,
    })
  end,
}
