return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		-- use a release tag to download pre-built binaries
		version = "v0.*",
		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',

		opts = {
			keymap = { preset = "super-tab" },

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- will be removed in a future release
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				use_nvim_cmp_as_default = true,

				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },

			-- experimental signature help support
			signature = {
				enabled = true,
				window = {
					show_documentation = false,
				},
			},

			completion = {
				ghost_text = {
					enabled = true,
					show_with_menu = true,
				},
			},
			cmdline = {
				enabled = true,
				completion = {
					menu = {
						auto_show = true,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
	-- config = function()
	-- 	require("luasnip.loaders.from_vscode").lazy_load()
	-- end,
}
