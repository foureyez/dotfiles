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
		},
		picker = {
			type = "fzf-lua",
		},
	},
	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.

		local wk = require("which-key")
		wk.add({
			{ "<leader>;", "<cmd>NeovimProjectDiscover<CR>", desc = "Browse Projects" },
		})
	end,
}
