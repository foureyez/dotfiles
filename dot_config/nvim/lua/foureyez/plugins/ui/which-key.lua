return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{
				"<leader>n",
				function()
					vim.o.rnu = not vim.o.rnu
				end,
				desc = "Buffer Previous",
			},
		})
	end,
}
