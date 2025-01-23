return {
	"mfussenegger/nvim-dap",
	lazy = true,
	cmd = "DapContinue",
	dependencies = {
		{ "igorlfs/nvim-dap-view", opts = {} },
	},
	config = function()
		-- Automatically open/close dapui when debugger is active/inactive
		local dap = require("dap")
		-- local dapui = require("dapui")
		local dapview = require("dap-view")
		dap.listeners.before.attach.dapui_config = function()
			dapview.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapview.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapview.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapview.close()
		end

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}

		dap.configurations.c = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = "Select and attach to process",
				type = "gdb",
				request = "attach",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				pid = function()
					local name = vim.fn.input("Executable name (filter): ")
					return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = "${workspaceFolder}",
			},
			{
				name = "Attach to gdbserver :1234",
				type = "gdb",
				request = "attach",
				target = "localhost:1234",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
			},
		}
		dap.configurations.odin = dap.configurations.c

		-- vim.api.nvim_create_user_command("DapUIClose", dapui.close, {})
		-- vim.api.nvim_create_user_command("DapUIOpen", dapui.open, {})
	end,
}
