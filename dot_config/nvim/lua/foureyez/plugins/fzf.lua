return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({
			winopts = {
				border = "single",
			},
		})

		local wk = require("which-key")
		wk.add({
			{ "<leader>bl", "<cmd>FzfLua dap_breakpoints<CR>", desc = "List all debug endpoints" },
			{ "<leader>/", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
			{ "<leader>dl", "<cmd>FzfLua diagnostics_workspace<CR>", desc = "List all workspace diagnostics" },
			{ "<leader>f", "<cmd>FzfLua files winopts.width=0.5 winopts.preview.hidden=yes<CR>", desc = "Find Files" },
		})
	end,
}
