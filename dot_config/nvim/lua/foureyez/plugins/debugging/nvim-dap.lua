return {
	"mfussenegger/nvim-dap",
	lazy = true,
	cmd = "DapContinue",
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

		vim.api.nvim_create_user_command("DapUIClose", dapui.close, {})
		vim.api.nvim_create_user_command("DapUIOpen", dapui.open, {})
	end,
}
