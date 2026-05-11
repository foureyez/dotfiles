return {
	"MagicDuck/grug-far.nvim",
	lazy = true,
	cmd = "GrugFar",
	config = function()
		require("grug-far").setup({})
	end,
}
