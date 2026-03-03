local aug = vim.api.nvim_create_augroup("buf_large", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
    if ok and stats and (stats.size > 100000) then
      vim.b.large_buf = true
      vim.cmd("syntax off")
      -- vim.cmd("IlluminatePauseBuf") -- disable vim-illuminate
      pcall(vim.cmd, "IBLDisable") -- disable indent-blankline.nvim
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.spell = false
    else
      pcall(vim.cmd, "IBLEnable") -- re-enable indent-blankline.nvim
      vim.b.large_buf = false
    end
  end,
  group = aug,
  pattern = "*",
})




vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'yaml', 'helm', 'Makefile', 'bash', 'json', 'odin', 'xml', 'gotmpl', 'terraform', 'c', 'proto' },
  callback = function() vim.treesitter.start() end,
})
