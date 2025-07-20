return {
	"codethread/qmk.nvim",
	config = function()
		local config = {
			name = "LAYOUT_split_3x6_3",
			layout = {
				"x x x x x x _ x x x x x x",
				"x x x x x x _ x x x x x x",
				"x x x x x x _ x x x x x x",
				"_ _ _ x x x _ x x x _ _ _",
			},
		}
		local onemoreconfig = {
			name = "LAYOUT_split_4x6_5",
			layout = {
				"x x x x x x _ x x x x x x",
				"x x x x x x _ x x x x x x",
				"x x x x x x _ x x x x x x",
				"x x x x x x _ x x x x x x",
				"_ _ _ x x x _ x x x _ _ _",
				"_ _ _ _ x x _ x x _ _ _ _",
			},
		}
		require("qmk").setup(onemoreconfig)
	end,
}
