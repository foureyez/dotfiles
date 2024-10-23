return {
	"theHamsta/nvim-dap-virtual-text",
	lazy = true,
	cmd = "DapContinue",
	config = function()
		require("nvim-dap-virtual-text").setup()
	end,
}
