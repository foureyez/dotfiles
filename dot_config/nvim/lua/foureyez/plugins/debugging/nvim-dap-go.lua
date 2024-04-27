return {
	"leoluz/nvim-dap-go",
	ft = "go",
	dependencies = "mfussenegger/nvim-dap",
	config = function()
		require("dap-go").setup({
			-- Additional dap configurations can be added.
			-- dap_configurations accepts a list of tables where each entry
			-- represents a dap configuration. For more details do:
			-- :help dap-configuration
			dap_configurations = {
				{
					type = "go",
					name = "Debug Terminal",
					request = "launch",
					console = "integratedConsole",
					program = "${file}",
				},
			},
		})
	end,
}
