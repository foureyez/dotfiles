return {
	{
		"coffebar/neovim-project",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			-- optional picker
			{ "ibhagwan/fzf-lua" },
			{ "Shatur/neovim-session-manager" },
		},
		lazy = false,
		priority = 100,
		keys = {
			{ "<leader>;", "<cmd>NeovimProjectDiscover<CR>", desc = "Discover projects" },
		},
		opts = {
			projects = { -- define project roots
				-- "~/workspace/*",
				"~/workspace/*",
				"~/personal_workspace/*",
				"~/.local/share/chezmoi",
			},
			picker = {
				type = "fzf-lua",
				preview = {
					enabled = false,
				},
				opts = {
					winopts = {
						width = 0.4,
						height = 0.5,
					},
				},
			},
			-- sessionoptions (including globals) already set in core/options.lua
		},
	},
}
