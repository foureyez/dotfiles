return {
	"kdheepak/lazygit.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.g.lazygit_use_custom_config_file_path = 1
		vim.g.lazygit_config_file_path = vim.fn.expand("~/.config/nvim/lazy.yaml")

		-- Add Mappings
		local wk = require("which-key")
		wk.register({
			["<leader>gg"] = { "<cmd>LazyGit<CR>", "Open LazyGit" },
		})
	end,
}
