return {
	"sindrets/diffview.nvim",
	config = function()
		local wk = require("which-key")
		wk.register({
			["<leader>gf"] = { "<cmd>DiffviewFileHistory %<CR>", "Open Git History for current file" },
			["<leader>gh"] = { "<cmd>DiffviewFileHistory<CR>", "Open git history" },
			["<leader>gc"] = { "<cmd>DiffviewClose<CR>", "Open git history" },
		})
	end,
}
