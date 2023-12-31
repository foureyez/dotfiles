return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	lazy = true,
	ft = { "go", "yaml", "lua", "toml", "json" },
	config = function()
		require("harpoon").setup({})

		local wk = require("which-key")
		wk.register({
			["<leader>h"] = {
				name = "harpoon",
				a = {
					function()
						require("harpoon.mark").add_file()
					end,
					"Mark File",
				},
				u = {
					function()
						require("harpoon.ui").toggle_quick_menu()
					end,
					"Toggle Quick menu",
				},
			},
		})
	end,
}
