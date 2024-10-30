return {
	{
		event = { "BufReadPre", "BufNewFile" },
		"christoomey/vim-tmux-navigator",
	},
	{
		event = { "BufReadPre", "BufNewFile" },
		ft = { "md" },
		"MeanderingProgrammer/markdown.nvim",
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("render-markdown").setup({})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"MagicDuck/grug-far.nvim",
		lazy = true,
		cmd = "GrugFar",
		config = function()
			require("grug-far").setup({})
		end,
	},
	{
		{
			"stevearc/oil.nvim",
			lazy = true,
			cmd = "Oil",
			opts = {
				view_options = {
					show_hidden = true,
				},
			},
			-- Optional dependencies
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
	},
	{
		-- "folke/zen-mode.nvim",
		-- opts = {
		--   -- your configuration comes here
		--   -- or leave it empty to use the default settings
		--   -- refer to the configuration section below
		-- },
	},
	-- For dimming the inactive parts of code
	{
		-- "folke/twilight.nvim",
		-- opts = {
		--   -- your configuration comes here
		--   -- or leave it empty to use the default settings
		--   -- refer to the configuration section below
		-- },
	},
	{
		"AckslD/nvim-neoclip.lua",
		lazy = true,
		keys = {
			{ "<leader>fa", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
		},
		dependencies = {
			{ "kkharji/sqlite.lua", module = "sqlite" },
			-- you'll need at least one of these
			{ "nvim-telescope/telescope.nvim" },
			-- {'ibhagwan/fzf-lua'},
		},
		config = function()
			require("neoclip").setup({
				enable_persistent_history = true,
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup()

			local wk = require("which-key")
			wk.add({
				{ "<leader>gb", "<cmd>Gitsigns blame<CR>", desc = "Git blame current file" },
				{ "<leader>gbl", "<cmd>Gitsigns blame_line<CR>", desc = "Git blame current file" },
			})
		end,
	},
	-- {
	-- 	"sindrets/diffview.nvim",
	-- 	config = function()
	-- 		local wk = require("which-key")
	-- 		wk.add({
	-- 			{ "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", desc = "Open Git History for current file" },
	-- 			{ "<leader>gh", "<cmd>DiffviewFileHistory<CR>", desc = "Open git history" },
	-- 			{ "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Open git history" },
	-- 		})
	-- 	end,
	-- },
}
