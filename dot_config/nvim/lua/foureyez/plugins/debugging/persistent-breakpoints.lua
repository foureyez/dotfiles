return {
	"Weissle/persistent-breakpoints.nvim",
	lazy = true,
	keys = {
		{ "<leader>b", "<cmd>PBToggleBreakpoint<CR>", desc = "Toggle breakpoint" },
		{ "<leader>dc", "<cmd>PBClearAllBreakpoints<CR>", desc = "Clear all breakpoints" },
	},
	config = function()
		require("persistent-breakpoints").setup({
			load_breakpoints_event = { "BufReadPost" },
		})
	end,
}
