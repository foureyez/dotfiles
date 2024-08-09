return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({})

			local wk = require("which-key")
			wk.add({
				{ "<leader>t", group = "file" },
				{ "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
			})
		end,
	},
}
