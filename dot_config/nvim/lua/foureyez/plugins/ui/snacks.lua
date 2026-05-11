return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	opts = {
		notifier = {
			timeout = 5000, -- default timeout in ms
			width = { min = 40, max = 0.4 },
			height = { min = 1, max = 60 },
			-- editor margin to keep free. tabline and statusline are taken into account automatically
			margin = { top = 0, right = 1, bottom = 0 },
			padding = true, -- add 1 cell of left/right padding to the notification window
			sort = { "level", "added" }, -- sort by level and time
		},
	},
}
