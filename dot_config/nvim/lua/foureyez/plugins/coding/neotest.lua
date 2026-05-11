return {
  {
    "nvim-neotest/neotest",
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Neotest: run nearest" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Neotest: run file" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Neotest: toggle summary" },
      { "<leader>to", function() require("neotest").output_panel.toggle() end, desc = "Neotest: toggle output panel" },
    },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      {
        "fredrikaverpil/neotest-golang",
        version = "*",  -- Optional, but recommended; track releases
        build = function()
          vim.system({"go", "install", "gotest.tools/gotestsum@latest"}):wait() -- Optional, but recommended
        end,
      },
    },
    config = function()
      local config = {
        runner = "gotestsum", -- Optional, but recommended
      }
      require("neotest").setup({
        adapters = {
          require("neotest-golang")(config),
        },
      })
    end,
  },
}
