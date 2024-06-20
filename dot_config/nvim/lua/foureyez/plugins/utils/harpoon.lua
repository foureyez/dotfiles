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
		wk.register({
			["<leader>h"] = {
				name = "harpoon",
				a = {
					function()
						harpoon:list():add()
					end,
					"Mark File",
				},
				l = {
					function()
						toggle_telescope(harpoon:list())
					end,
					"Toggle Quick menu",
				},
				p = {
					function()
						harpoon:list():prev()
					end,
					"Prev file",
				},
				n = {
					function()
						harpoon:list():next()
					end,
					"Next File",
				},
			},
		})
	end,
}
