vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. ":" .. vim.env.PATH
require("foureyez.core")
require("foureyez.lazy")
require("foureyez.keymaps")
