return {
	"f-person/git-blame.nvim",
	cmd = { "GitBlameToggle", "GitBlameEnable", "GitBlameCopySHA" },
	config = function()
		require("gitblame").setup({
			enabled = false,
		})
	end,
}
