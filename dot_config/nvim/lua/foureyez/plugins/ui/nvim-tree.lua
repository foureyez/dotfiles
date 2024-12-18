return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	-- lazy = true,
	-- cmd = "NvimTreeToggle",
	config = function()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				-- side = "right",
				width = 35,
				centralize_selection = true,
			},
			renderer = {
				group_empty = true,
				indent_markers = {
					enable = true,
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					-- min = vim.diagnostic.severity.HINT,
					-- max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
			sync_root_with_cwd = true,
			-- respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				-- update_root = true,
			},
		})

		-- SETUP KEYMAPS
		local wk = require("which-key")
		wk.add({
			-- { "<C-n>", "<CMD>NvimTreeToggle<CR>", desc = "Toggle nvimtree" },
			{ "<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Focus Nvimtree" },
		})
	end,
}