return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		{ "fredrikaverpil/neotest-golang", version = "*" },
	},
	lazy = true,
	cmd = "Neotest run",
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-golang"), -- Registration
			},
		})
	end,
}
