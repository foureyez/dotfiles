return {
	"Weissle/persistent-breakpoints.nvim",
	lazy = true,
	event = "BufReadPost",
	config = function()
		require("persistent-breakpoints").setup({
			load_breakpoints_event = { "BufReadPost" },
		})
	end,
}
