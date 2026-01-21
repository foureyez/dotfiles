return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    {
      "nvim-treesitter/nvim-treesitter", -- Optional, but recommended
      branch = "main",                   -- NOTE; not the master branch!
      build = function()
        vim.cmd(":TSUpdate go")
      end,
    },
    {
      "fredrikaverpil/neotest-golang",
      version = "*",
      build = function()
        vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
      end,
    },
  },
  config = function()
    local config = {
      runner = "gotestsum",
    }
    require("neotest").setup({
      adapters = {
        require("neotest-golang")(config),
      },
    })
  end,
}
