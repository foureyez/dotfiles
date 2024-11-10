return {
	"nvim-tree/nvim-web-devicons",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-web-devicons").setup({
			override = {},
			color_icons = true,
			default = true,
			strict = true,
			variant = "dark",
			override_by_extension = {
				["odin"] = {
					icon = " ",
					color = "#1D5085",
					name = "Odin",
				},
			},
		})
	end,
}
