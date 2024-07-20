return {
	"mfussenegger/nvim-dap",
	config = function()
		-- Automatically open/close dapui when debugger is active/inactive
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		local wk = require("which-key")
		wk.add({
			{
				"<F10>",
				function()
					require("dap").step_over()
				end,
				desc = "Debugger step over",
			},
			{
				"<F11>",

				function()
					require("dap").step_into()
				end,
				desc = "Debugger step into",
			},
			{
				"<F12>",
				function()
					require("dap").step_out()
				end,
				desc = "Debugger step out",
			},
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "Debugger Continue",
			},
		})
	end,
}
