return {
  "arnamak/stay-centered.nvim",
  config = function()
    require("stay-centered").setup({
      skip_filetypes = { "NvimTree" },
    })
  end,
}
