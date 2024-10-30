return {
	"Weissle/persistent-breakpoints.nvim",
	lazy = true,
	event = "BufReadPost",
	config = function()
		require("persistent-breakpoints").setup({
			load_breakpoints_event = { "BufReadPost" },
		})

		local wk = require("which-key")
		wk.add({
			{
				"<leader>db",
				"<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
				desc = "Toggle breakpoint at line",
			},
			{
				"<leader>dbc",
				"<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
				desc = "Set conditional breakpoint at line",
			},
			{
				"<leader>dbd",
				"<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",
				desc = "Clear all breakpoints",
			},
		})
	end,
}
