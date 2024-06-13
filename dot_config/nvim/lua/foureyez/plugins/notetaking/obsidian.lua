return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {},
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "personal",
					path = "~/personal_workspace/obsidian-vault",
				},
				{
					name = "work",
					path = "~/workspace/notes",
				},
			},
			notes_subdir = "notes",
			daily_notes = {
				-- Optional, if you keep daily notes in a separate directory.
				folder = "dailies",
				-- Optional, if you want to change the date format for the ID of daily notes.
				date_format = "%Y/%m/%d",
				-- Optional, if you want to change the date format of the default alias of daily notes.
				alias_format = "%B %-d, %Y",
				-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
				template = nil,
			},

			-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
			completion = {
				-- Set to false to disable completion.
				nvim_cmp = true,
				-- Trigger completion at 2 chars.
				min_chars = 2,
			},

			-- Where to put new notes. Valid options are
			--  * "current_dir" - put new notes in same directory as the current buffer.
			--  * "notes_subdir" - put new notes in the default notes subdirectory.
			new_notes_location = "notes_subdir",

			-- Optional, customize how note IDs are generated given an optional title.
			note_id_func = function(title)
				-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
				-- In this case a note with the title 'My new note' will be given an ID that looks
				-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,
		})

		local wk = require("which-key")
		wk.register({
			["<leader>o"] = {
				w = { "<cmd>ObsidianWorkspace<CR>", "Obsidian switch workspace" },
				n = { "<cmd>ObsidianNew<CR>", "Obsidian new note" },
				c = { "<cmd>ObsidianToggleCheckbox<CR>", "Obsidian toggle checkbox" },
				t = { "<cmd>ObsidianToday<CR>", "Obsidian create todays journal" },
				y = { "<cmd>ObsidianYesterday<CR>", "Obsidian search" },
				tt = { "<cmd>ObsidianTomorrow<CR>", "Obsidian search" },
				s = { "<cmd>ObsidianSearch<CR>", "Obsidian search" },
			},
		})
	end,
}
