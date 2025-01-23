return {
	"Weissle/persistent-breakpoints.nvim",
	lazy = true,
	cmd = "PBToggleBreakpoint",
	config = function()
		require("persistent-breakpoints").setup({
			load_breakpoints_event = { "BufReadPost" },
		})
	end,
}
