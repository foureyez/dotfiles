return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		opts = {},
		init = function()
			-- Ensure mason-installed binaries are on PATH before any LSP starts
			vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. ":" .. vim.env.PATH
		end,
	},
}
