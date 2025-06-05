return {
	{
		"mason-org/mason.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local mason = require("mason")
			mason.setup()
		end,
	},
}
