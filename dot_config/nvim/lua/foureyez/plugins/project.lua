return {
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
			"~/workspace/*",
			"~/.local/share/chezmoi",
			"/usr/lib/odin",
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
	},
}
