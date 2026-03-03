return {
	"akinsho/toggleterm.nvim",
	version = "*",
	-- opts = {},
	-- config = true,
	cmd = "ToggleTerm",
	config = function()
		require("toggleterm").setup({
			highlights = {
				FloatBorder = {
					guifg = "#615d59",
				},
			},
		})
	end,
}
