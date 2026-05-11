local float_term_opts = { direction = "float", hidden = true }

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = "ToggleTerm",
	keys = {
		{
			"<leader>l",
			function()
				local terminal = require("toggleterm.terminal").Terminal
				terminal
					:new(vim.tbl_deep_extend("force", float_term_opts, { cmd = "lazygit", dir = vim.fn.getcwd() }))
					:toggle()
			end,
			desc = "Open lazygit",
		},
		{
			"<leader>g",
			function()
				local terminal = require("toggleterm.terminal").Terminal
				terminal
					:new(vim.tbl_deep_extend("force", float_term_opts, { cmd = "gitui", dir = vim.fn.getcwd() }))
					:toggle()
			end,
			desc = "Open gitui",
		},
		{ "<leader>mt", "<cmd>ToggleTerm direction=float<CR>", desc = "Float terminal" },
	},
	config = function()
		require("toggleterm").setup({
			highlights = {
				FloatBorder = {
					guifg = "#615d59",
				},
			},
		})
	end,
}
