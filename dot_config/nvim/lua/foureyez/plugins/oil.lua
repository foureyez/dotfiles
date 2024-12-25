return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = true,
	cmd = "Oil",
	opts = {
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			["<C-h>"] = { "actions.parent" },
			["<C-l>"] = { "actions.select" },
			["<C-p>"] = "actions.preview",
			["<C-c>"] = { "actions.close", mode = "n" },
			["_"] = { "actions.open_cwd", mode = "n" },
			["g."] = { "actions.toggle_hidden", mode = "n" },
			["g\\"] = { "actions.toggle_trash", mode = "n" },
		},
		float = {
			padding = 2,
			max_width = 150,
			max_height = 100,
			-- border = "rounded",
			win_options = {
				winblend = 0,
			},
			-- preview_split: Split direction: "auto", "left", "right", "above", "below".
			preview_split = "auto",
			-- This is the config that will be passed to nvim_open_win.
			-- Change values here to customize the layout
			override = function(conf)
				return conf
			end,
		},
	},
}