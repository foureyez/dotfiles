return {
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- { "scottmckendry/cyberdream.nvim", priority = 1000 },
	-- { "rose-pine/neovim", name = "rose-pine" },
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				compile = true, -- enable compiling the colorscheme
				overrides = function(colors) -- add/modify highlights
					local theme = colors.theme
					local overrides = {
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = theme.ui.bg_p1 },
						TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },
						TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },

						NvimTreeWinSeparator = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
					}

					return overrides
				end,
				theme = "wave", -- Load "wave" theme when 'background' option is not set
			})
			vim.cmd("colorscheme kanagawa")
		end,
	},
}
