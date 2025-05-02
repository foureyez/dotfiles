return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',

		opts = {
			keymap = { preset = "super-tab" },

			appearance = {
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
				documentation = { auto_show = false },
				ghost_text = {
					enabled = true,
					show_with_menu = true,
				},
			},
			cmdline = {
				keymap = {
					preset = "inherit",
				},
				completion = {
					-- ghost_text = { enabled = true },
					menu = { auto_show = true },
				},
			},
		},
		opts_extend = { "sources.default" },
	},
	-- config = function()
	-- 	require("luasnip.loaders.from_vscode").lazy_load()
	-- end,
}
