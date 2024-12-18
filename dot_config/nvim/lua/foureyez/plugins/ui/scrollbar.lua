return {
	-- {
	-- 	"petertriho/nvim-scrollbar",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function()
	-- 		require("scrollbar").setup()
	-- 	end,
	-- },
	{
		"lewis6991/satellite.nvim",
		config = function()
			require("satellite").setup({})
		end,
	},
}
