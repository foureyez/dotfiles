local default = vim.api.nvim_create_augroup("default", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead" }, {
	pattern = { "*.vert", "*.frag" },
	group = default,
	command = "setfiletype glsl",
})
