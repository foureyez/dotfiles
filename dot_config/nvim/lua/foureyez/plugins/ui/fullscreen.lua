return {
	"propet/toggle-fullscreen.nvim",
	keys = {
		{
			"<leader>w",
			function()
				require("toggle-fullscreen"):toggle_fullscreen()
			end,
			desc = "toggle-fullscreen",
		},
	},
}
