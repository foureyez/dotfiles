return {
  "nvim-telescope/telescope-frecency.nvim",
  config = function()
    require("telescope").load_extension("frecency")
    local wk = require("which-key")
    wk.register({
      ["<leader><leader>"] = {
        "<cmd>Telescope frecency workspace=CWD<CR>",
        "Telescope find files using frecency",
      },
    })
  end,
}
