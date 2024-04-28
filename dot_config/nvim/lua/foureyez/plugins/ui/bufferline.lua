return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "Nvim Tree",
						separator = true,
						text_align = "left",
					},
				},
				globalstatus = false,
				separator_style = "thin",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or "")
						s = s .. n .. sym
					end
					return s
				end,
			},
		})
	end,
}
