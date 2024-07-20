return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-project.nvim",
		"nvim-telescope/telescope-dap.nvim",
	},
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("dap")
		telescope.load_extension("lazygit")
		-- telescope.load_extension("file_browser")

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
					previewer = false,
					layout_config = {
						prompt_position = "top",
						width = 0.4,
					},
					sorting_strategy = "ascending",
					theme = "dropdown",
				},
			},
			extensions_list = { "project" },
			extensions = {
				project = {
					theme = "dropdown",
					hidden_files = true,
					order_by = "asc",
					sync_with_nvim_tree = true, -- default false
					search_by = "title",
					on_project_selected = function(prompt_bufnr)
						local project_actions = require("telescope._extensions.project.actions")
						project_actions.change_working_directory(prompt_bufnr, false)
						require("telescope.builtin").find_files()
					end,
				},
				file_browser = {
					-- theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					-- hijack_netrw = true,
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
				function()
					telescope.extensions.project.project({})
				end,
				desc = "Switch Project",
			},
			{
				"<leader>dl",
				function()
					telescope.extensions.dap.list_breakpoints({})
				end,
				desc = "List all debug endpoints",
			},
			{ "<leader>f", group = "file" },
			{ "<leader>fa", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers theme=dropdown<CR>", desc = "Open Buffers" },
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		})
	end,
}
