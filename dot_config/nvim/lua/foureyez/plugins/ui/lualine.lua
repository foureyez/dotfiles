return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lazy_status = require("lazy.status")
		local lint_progress = function()
			local linters = require("lint").get_running()
			if #linters == 0 then
				return "󰦕"
			end
			return "󱉶 " .. table.concat(linters, ", ")
		end

		require("lualine").setup({
			options = {
				-- theme = "onedark",
				-- theme = "kanagawa",
				-- theme = "gruvbox-material",
				theme = "ayu",
				disabled_filetypes = { "packer", "NvimTree" },
			},
			sections = {
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_y = {
					function()
						return require("dap").status()
					end,
					icon = { "", color = { fg = "#e7c664" } }, -- nerd icon.
					cond = function()
						if not package.loaded.dap then
							return false
						end
						local session = require("dap").session()
						return session ~= nil
					end,
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ lint_progress },
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
