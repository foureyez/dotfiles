vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "yaml", "helm", "Makefile", "bash", "json", "odin", "xml", "gotmpl", "terraform", "c", "proto" },
	callback = function()
		vim.treesitter.start()
	end,
})
