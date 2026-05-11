return {
	"mfussenegger/nvim-dap",
	lazy = true,
	keys = {
		{ "<F2>", function() require("dap").step_into() end, desc = "DAP step into" },
		{ "<F3>", function() require("dap").step_over() end, desc = "DAP step over" },
		{ "<F4>", function() require("dap").step_out() end, desc = "DAP step out" },
		{ "<F5>", function() require("dap").continue() end, desc = "DAP continue" },
		{ "<leader>dr", function() require("dap").run_to_cursor() end, desc = "DAP run to cursor" },
	},
	dependencies = {
		-- { "igorlfs/nvim-dap-view", opts = {} },
	},
	config = function()
		-- Automatically open/close dapui when debugger is active/inactive
		local dap = require("dap")
		local dapui = require("dapui")
		-- local dapview = require("dap-view")
		dap.listeners.before.attach.dapui_config = function()
			-- dapview.open()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			-- dapview.open()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			-- dapview.close()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			-- dapview.close()
			dapui.close()
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

		vim.api.nvim_create_user_command("DapUIClose", dapui.close, {})
		vim.api.nvim_create_user_command("DapUIOpen", dapui.open, {})
	end,
}
