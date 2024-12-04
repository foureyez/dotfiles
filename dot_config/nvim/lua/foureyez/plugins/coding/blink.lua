return {
	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = {
			-- "L3MON4D3/LuaSnip",
			-- "saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			-- lock compat to tagged versions, if you've also locked blink.cmp to tagged versions
			-- { "saghen/blink.compat", version = "*", opts = { impersonate_nvim_cmp = true } },
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
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			sources = {
				completion = {
					enabled_providers = { "lsp", "path", "snippets", "buffer" },
				},
			},

			-- experimental auto-brackets support
			completion = { accept = { auto_brackets = { enabled = true } } },

			-- experimental signature help support
			signature = { enabled = true },
		},
		opts_extend = { "sources.completion.enabled_providers" },
	},
}
