return {
	"theHamsta/nvim-dap-virtual-text",
	event = "VeryLazy",
	config = function()
		require("nvim-dap-virtual-text").setup()
	end,
}
