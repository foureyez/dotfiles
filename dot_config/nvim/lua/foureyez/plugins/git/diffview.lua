return {
	"sindrets/diffview.nvim",
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", desc = "Open Git History for current file" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory<CR>", desc = "Open git history" },
			{ "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Open git history" },
		})
	end,
}
