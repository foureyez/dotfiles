return {
	"rcarriga/nvim-dap-ui",
	lazy = true,
	keys = {
		{ "<leader>?", function() require("dapui").eval(nil, { enter = true }) end, desc = "DAP eval under cursor" },
	},
	dependencies = {
		"nvim-neotest/nvim-nio",
	},
	config = function()
		require("dapui").setup()
		vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapLogPoint",
			{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
		)
	end,
}
