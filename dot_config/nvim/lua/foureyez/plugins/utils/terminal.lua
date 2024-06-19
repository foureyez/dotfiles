return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup()
		local wk = require("which-key")
		wk.register({
			["<leader>th"] = { "<cmd>ToggleTerm direction=horizontal<CR>", "Toggle Terminal Horizontal" },
			["<leader>tv"] = { "<cmd>ToggleTerm direction=vertical size=80<CR>", "Toggle Terminal Vertical" },
		})
	end,
}
