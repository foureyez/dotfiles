return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    timeout = 5000,
    max_width = function()
      return math.floor(vim.o.columns * 0.4)
    end,
    max_height = function()
      return math.floor(vim.o.lines * 0.6)
    end,
    render = "wrapped-compact",
    stages = "fade_in_slide_out",
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    vim.notify = notify
  end,
}
