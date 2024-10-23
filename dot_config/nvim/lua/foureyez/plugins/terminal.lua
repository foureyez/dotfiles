return {
	"akinsho/toggleterm.nvim",
	version = "*",
	-- opts = {},
	-- config = true,
	config = function()
		require("toggleterm").setup({
			highlights = {
				FloatBorder = {
					guifg = "#a5adcb",
				},
			},
		})
		local Terminal = require("toggleterm.terminal").Terminal
		local wk = require("which-key")
		wk.add({
			{
				"<leader>gg",
				function()
					Terminal:new({
						cmd = "lazygit",
						dir = vim.fn.getcwd(),
						direction = "float",
						hidden = true,
					}):toggle()
				end,
				desc = "Open LazyGit",
			},
		})
	end,
}
