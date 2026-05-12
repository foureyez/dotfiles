return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	config = function()
		local lazy_status = require("lazy.status")
		local function current_project()
			return "󰉋 " .. vim.fs.basename(vim.fn.getcwd())
		end

		require("lualine").setup({
			options = {
				-- theme = "onedark",
				-- theme = "kanagawa",
				theme = "gruvbox-material",
				-- theme = "ayu",
				disabled_filetypes = { "packer", "NvimTree" },
			},
			sections = {
				lualine_c = {
					{ current_project },
					{
						"filename",
						path = 1,
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_y = {},
			},
		})
	end,
}
