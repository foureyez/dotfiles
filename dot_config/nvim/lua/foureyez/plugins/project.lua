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
			init = function()
				-- enable saving the state of plugins in the session
				vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
			end,
		},
	},
}
