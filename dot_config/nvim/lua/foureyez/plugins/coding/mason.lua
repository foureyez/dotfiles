return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		config = function()
			local mason = require("mason")
			mason.setup()
		end,
	},
}
