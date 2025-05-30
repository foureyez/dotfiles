return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		-- check the installation instructions at
		-- https://github.com/folke/snacks.nvim
		"folke/snacks.nvim",
	},
	keys = {
		{
			"<leader>e",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>E",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			"<c-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	---@type YaziConfig | {}
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
		integrations = {
			--- What should be done when the user wants to grep in a directory
			grep_in_directory = function(directory)
				-- the default implementation uses telescope if available, otherwise nothing
			end,

			grep_in_selected_files = function(selected_files)
				-- similar to grep_in_directory, but for selected files
			end,

			--- Similarly, search and replace in the files in the directory
			replace_in_directory = function(directory)
				-- default: grug-far.nvim
			end,

			replace_in_selected_files = function(selected_files)
				-- default: grug-far.nvim
			end,

			-- `grealpath` on OSX, (GNU) `realpath` otherwise
			resolve_relative_path_application = "",

			-- how to delete (close) a buffer. Defaults to `snacks.bufdelete` from
			-- https://github.com/folke/snacks.nvim, which maintains the window
			-- layout.
			bufdelete_implementation = "snacks-if-available",

			-- add an action to a file picker to copy the relative path to the
			-- selected file(s). The implementation is the same as for the
			-- `copy_relative_path_to_selected_files` yazi.nvim keymap. Currently
			-- only snacks.nvim is supported. Documentation can be found in the
			-- keybindings section of the readme.
			--
			-- available options:
			-- - nil (default, no action added)
			-- - "snacks.picker" (snacks.nvim)
			picker_add_copy_relative_path_action = nil,
		},
	},
	-- 👇 if you use `open_for_directories=true`, this is recommended
	init = function()
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		-- vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}
