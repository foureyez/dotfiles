return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-project.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local project_actions = require("telescope._extensions.project.actions")

		-- telescope.load_extension("dap")
		telescope.load_extension("project")

		telescope.setup({
			pickers = {
				buffers = {
					previewer = false,
					theme = "dropdown",
					mappings = {
						n = {
							["<C-e>"] = "delete_buffer",
							["l"] = "select_default",
						},
					},
					initial_mode = "normal",
				},
				current_buffer_fuzzy_find = {
					previewer = false,
				},
				find_files = {
					theme = "dropdown",
					previewer = false,
					layout_config = {
						prompt_position = "top",
						width = 0.4,
					},
					sorting_strategy = "ascending",
				},
			},
			extensions = {
				project = {
					theme = "dropdown",
					hidden_files = true,
					sync_with_nvim_tree = true,
					search_by = "title",
					on_project_selected = function(prompt_bufnr)
						project_actions.change_working_directory(prompt_bufnr, false)
						project_actions.find_project_files()
					end,
				},
				file_browser = {
					-- theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					initial_mode = "normal",
					picker = {
						depth = 1,
					},
				},
				heading = {
					treesitter = true,
				},
				advanced_git_search = {
					diff_plugin = "diffview",
				},
			},
		})

		-- Setup Keymaps
		local wk = require("which-key")
		wk.add({
			{
				"<leader>;",
				"<cmd>Telescope project theme=dropdown<CR>",
				desc = "Switch Project",
			},
			{
				"<leader>bl",
				function()
					telescope.extensions.dap.list_breakpoints({})
				end,
				desc = "List all debug endpoints",
			},
			{ "<leader>/", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
			-- { "<leader>b", "<cmd>Telescope buffers theme=dropdown<CR>", desc = "Open Buffers" },
			{ "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
			{ "<leader>c", "<cmd>Telescope neoclip plus<CR>", desc = "Find Clipboard" },
		})

		-- if vim.v.argv[3] == nil then
		-- 	telescope.extensions.project.project({})
		-- end
	end,
}
