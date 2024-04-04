return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("lualine").setup({
			options = {
				-- theme = "onedark",
				theme = "tokyonight",
				disabled_filetypes = { "packer", "NvimTree" },
			},
		})
	end,
}
