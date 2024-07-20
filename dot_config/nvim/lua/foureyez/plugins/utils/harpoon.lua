return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	lazy = true,
	ft = { "go", "yaml", "lua", "toml", "json" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()

		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		local wk = require("which-key")
		wk.add({
			{ "<leader>h", group = "harpoon" },
			{
				"<leader>ha",
				function()
					harpoon:list():add()
				end,
				desc = "Mark File",
			},
			{
				"<leader>hl",
				function()
					toggle_telescope(harpoon:list())
				end,
				desc = "Toggle Quick menu",
			},
			{
				"<leader>hn",
				function()
					harpoon:list():next()
				end,
				desc = "Next File",
			},
			{
				"<leader>hp",
				function()
					harpoon:list():prev()
				end,
				desc = "Prev file",
			},
		})
	end,
}
