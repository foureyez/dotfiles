return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		scope = {
			enabled = false,
		},
	},
	config = true,
	ft = {
		"go",
		"yaml",
		"json",
		"rs",
	},
}
