return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    -- { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "FzfLua files" },
    { "<leader>f",  "<cmd>FzfLua files winopts.width=0.5 winopts.preview.hidden=yes<CR>", desc = "Find files" },
    { "<leader>/",  "<cmd>FzfLua live_grep<CR>",                                          desc = "Live grep" },
    { "<leader>dl", "<cmd>FzfLua diagnostics_workspace<CR>",                              desc = "Workspace diagnostics" },
    { "<leader>db", "<cmd>FzfLua dap_breakpoints<CR>",                                    desc = "List breakpoints" },
  },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      winopts = {
        border = "single",
      },
    })
  end,
}
