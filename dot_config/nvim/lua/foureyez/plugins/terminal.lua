return {
	"akinsho/toggleterm.nvim",
	version = "*",
	-- opts = {},
	-- config = true,
	event = { "BufReadPre", "BufNewFile" },
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
