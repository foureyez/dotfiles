return {
	"kdheepak/lazygit.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- Add Mappings
		local wk = require("which-key")
		wk.register({
			["<leader>gg"] = { "<cmd>LazyGit<CR>", "Open LazyGit" },
		})
	end,
}
