return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
			},
		})
		local wk = require("which-key")
		wk.add({
			{ "<C-y>", "<CMD>BufferLineCyclePrev<CR>", desc = "Goto Left Buffer" },
			{ "<C-i>", "<CMD>BufferLineCycleNext<CR>", desc = "Goto Right buffer" },
		})
	end,
}
