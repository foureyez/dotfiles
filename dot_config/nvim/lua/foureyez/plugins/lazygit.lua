return {
  "kdheepak/lazygit.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- Add Mappings
    local wk = require("which-key")
    wk.register({
      ["<leader>gc"] = { "<cmd>LazyGitCurrentFile<CR>", "Open LazyGit" },
    })
  end,
}
