return {
  "mfussenegger/nvim-dap",
  config = function()
    -- Automatically open/close dapui when debugger is active/inactive
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    local wk = require("which-key")
    wk.register({
      ["<F5>"] = {
        function()
          require("dap").continue()
          vim.cmd("NvimTreeClose")
        end,
        "Debugger Continue",
      },
      ["<F10>"] = {
        function()
          require("dap").step_over()
        end,
        "Debugger step over",
      },
      ["<F11>"] = {
        function()
          require("dap").step_into()
        end,
        "Debugger step into",
      },
      ["<F12>"] = {
        function()
          require("dap").step_out()
        end,
        "Debugger step out",
      },
    })
  end,
}
