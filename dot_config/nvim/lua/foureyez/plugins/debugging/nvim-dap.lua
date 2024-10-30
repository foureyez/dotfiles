return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-telescope/telescope-dap.nvim",
	},
	cmd = "DapContinue",
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("dap")

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

		local wk = require("which-key")
		wk.add({
			{
				"<F3>",
				function()
					require("dap").step_over()
				end,
				desc = "Debugger step over",
			},
			{
				"<F2>",
				function()
					require("dap").step_into()
				end,
				desc = "Debugger step into",
			},
			{
				"<F4>",
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
