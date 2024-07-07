local default = vim.api.nvim_create_augroup("default", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead" }, {
	pattern = { "*.vert", "*.frag" },
	group = default,
	command = "setfiletype glsl",
})

local aug = vim.api.nvim_create_augroup("buf_large", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
		if ok and stats and (stats.size > 100000) then
			vim.b.large_buf = true
			vim.cmd("syntax off")
			vim.cmd("IlluminatePauseBuf") -- disable vim-illuminate
			pcall(vim.cmd, "IBLDisable") -- disable indent-blankline.nvim
			vim.opt_local.foldmethod = "manual"
			vim.opt_local.spell = false
		else
			pcall(vim.cmd, "IBLEnable") -- disable indent-blankline.nvim
			vim.b.large_buf = false
		end
	end,
	group = aug,
	pattern = "*",
})
