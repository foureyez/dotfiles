return {
	"codethread/qmk.nvim",
	config = function()
		local conf = {
			name = "LAYOUT_split_3x6_3",
			layout = {
				"x x x x x x _ x x x x x x",
				"x x x x x x _ x x x x x x",
				"x x x x x x _ x x x x x x",
				"_ _ _ x x x _ x x x _ _ _",
			},
		}
		require("qmk").setup(conf)
	end,
}
