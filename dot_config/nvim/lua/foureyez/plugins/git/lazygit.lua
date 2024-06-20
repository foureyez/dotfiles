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
			["<leader>gf"] = { "<cmd>LazyGitFilterCurrentFile<CR>", "Open Git History for current file" },
			["<leader>gh"] = { "<cmd>LazyGitFilter<CR>", "Open git history" },
		})
	end,
}
