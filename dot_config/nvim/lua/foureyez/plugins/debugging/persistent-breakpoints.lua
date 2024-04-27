return {
  "Weissle/persistent-breakpoints.nvim",
  config = function()
    require("persistent-breakpoints").setup({
      load_breakpoints_event = { "BufReadPost" },
    })

    local wk = require("which-key")
    wk.register({
      ["<leader>db"] = {
        "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
        "Toggle breakpoint at line",
      },
      ["<leader>dcb"] = {
        "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
        "Set conditional breakpoint at line",
      },
      ["<leader>dcc"] = {
        "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",
        "Clear all breakpoints",
      },
    })
  end,
}
