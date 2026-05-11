return {
	"stevearc/aerial.nvim",
	event = "LspAttach",
	keys = {
		{
			"<leader>a",
			function()
				require("aerial").snacks_picker({
					layout = {
						preset = "dropdown",
						preview = false,
					},
				})
			end,
			desc = "Aerial symbol picker",
		},
	},
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({
			attach_mode = "window",
			manage_check_interval = 500,
			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		})
	end,
}
