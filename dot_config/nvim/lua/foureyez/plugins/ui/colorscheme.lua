return {
	-- { "fenetikm/falcon" },
	-- {
	-- 	"wnkz/monoglow.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	config = function()
	-- 		require("nightfox").setup({
	-- 			palettes = {
	-- 				-- Custom duskfox with black background
	-- 				duskfox = {
	-- 					bg1 = "#1d1d2b", -- Black background
	-- 					bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
	-- 					bg3 = "#121820", -- 55% darkened from stock
	-- 					sel0 = "#131b24", -- 55% darkened from stock
	-- 				},
	-- 			},
	-- 			specs = {
	-- 				all = {
	-- 					inactive = "bg0", -- Default value for other styles
	-- 				},
	-- 				duskfox = {
	-- 					inactive = "#090909", -- Slightly lighter then black background
	-- 				},
	-- 			},
	-- 			groups = {
	-- 				all = {
	-- 					NormalNC = { fg = "fg1", bg = "inactive" }, -- Non-current windows
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- { "scottmckendry/cyberdream.nvim", priority = 1000 },
	{
		"sainnhe/gruvbox-material",
		name = "gruvbox",
		config = function()
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_show_eob = 0

			vim.api.nvim_create_autocmd("ColorScheme", {
				group = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {}),
				pattern = "gruvbox-material",
				callback = function()
					local config = vim.fn["gruvbox_material#get_configuration"]()
					local palette = vim.fn["gruvbox_material#get_palette"](
						config.background,
						config.foreground,
						config.colors_override
					)
					local set_hl = vim.fn["gruvbox_material#highlight"]

					set_hl("VertSplit", palette.bg_dim, palette.bg_dim)
					-- Change indentline colors
					set_hl("IblIndent", palette.bg3, palette.none)
					set_hl("NvimTreeIndentMarker", palette.bg3, palette.none)
					-- Highlight Root Folder name at top of NvimFileTree
					set_hl("NvimTreeRootFolder", palette.bg3, palette.red)
				end,
			})
		end,
	},
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("kanagawa").setup({
	-- 			-- dimInactive = true,
	-- 			compile = true, -- enable compiling the colorscheme
	-- 			overrides = function(colors) -- add/modify highlights
	-- 				local theme = colors.theme
	-- 				local overrides = {
	-- 					NormalFloat = { bg = "none" },
	-- 					FloatBorder = { bg = "none" },
	-- 					FloatTitle = { bg = "none" },
	--
	-- 					-- Save an hlgroup with dark background and dimmed foreground
	-- 					-- so that you can use it where your still want darker windows.
	-- 					-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
	-- 					NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
	--
	-- 					-- Popular plugins that open floats will link to NormalFloat by default;
	-- 					-- set their background accordingly if you wish to keep them dark and borderless
	-- 					LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
	-- 					MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
	--
	-- 					Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
	-- 					PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
	-- 					PmenuSbar = { bg = theme.ui.bg_m1 },
	-- 					PmenuThumb = { bg = theme.ui.bg_p2 },
	--
	-- 					NvimTreeWinSeparator = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
	-- 				}
	-- 				return overrides
	-- 			end,
	-- 			theme = "wave", -- Load "wave" theme when 'background' option is not set
	-- 		})
	-- 	end,
	-- },
}
