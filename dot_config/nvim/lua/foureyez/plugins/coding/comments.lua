return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("Comment").setup({
				toggler = {
					---Line-comment toggle keymap
					line = "<leader>/",
					---Block-comment toggle keymap
					block = "<leader>.",
				},
				opleader = {
					---Line-comment keymap
					line = "<leader>/",
					---Block-comment keymap
					block = "<leader>.",
				},
			})
		end,
	},
	{

		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
