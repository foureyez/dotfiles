return {
	{
		event = { "BufReadPre", "BufNewFile" },
		"christoomey/vim-tmux-navigator",
	},
	{
		"MeanderingProgrammer/markdown.nvim",
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		event = { "BufReadPre *.md" },
		ft = { "md" },
		lazy = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("render-markdown").setup({})
		end,
	},
	{
		"MagicDuck/grug-far.nvim",
		lazy = true,
		cmd = "GrugFar",
		config = function()
			require("grug-far").setup({})
		end,
	},
	-- {
	-- 	"AckslD/nvim-neoclip.lua",
	-- 	lazy = true,
	-- 	keys = {
	-- 		{ "<leader>c", "<cmd>Neoclip<CR>", desc = "Live Grep" },
	-- 	},
	-- 	dependencies = {
	-- 		{ "kkharji/sqlite.lua", module = "sqlite" },
	--    {'ibhagwan/fzf-lua'},
	-- 	},
	-- 	config = function()
	-- 		require("neoclip").setup({
	-- 			enable_persistent_history = true,
	-- 		})
	-- 	end,
	-- },
	{
		"f-person/git-blame.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitblame").setup({
				enabled = false,
			})
		end,
	},
	{
		"folke/snacks.nvim",
		opts = {
			notifier = {
				timeout = 5000, -- default timeout in ms
				width = { min = 40, max = 0.4 },
				height = { min = 1, max = 60 },
				-- editor margin to keep free. tabline and statusline are taken into account automatically
				margin = { top = 0, right = 1, bottom = 0 },
				padding = true, -- add 1 cell of left/right padding to the notification window
				sort = { "level", "added" }, -- sort by level and time
			},
		},
	},
}
