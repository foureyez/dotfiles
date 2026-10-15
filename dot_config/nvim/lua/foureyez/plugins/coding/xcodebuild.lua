return {
	"wojciech-kulik/xcodebuild.nvim",
	ft = { "swift", "objc", "objcpp" },
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>xb", "<cmd>XcodebuildBuild<CR>",            desc = "Xcode: build" },
		{ "<leader>xr", "<cmd>XcodebuildBuildRun<CR>",         desc = "Xcode: build & run" },
		{ "<leader>xR", "<cmd>XcodebuildRun<CR>",              desc = "Xcode: run (no build)" },
		{ "<leader>xt", "<cmd>XcodebuildTest<CR>",             desc = "Xcode: run tests" },
		{ "<leader>xT", "<cmd>XcodebuildTestClass<CR>",        desc = "Xcode: run tests in class" },
		{ "<leader>xl", "<cmd>XcodebuildToggleLogs<CR>",       desc = "Xcode: toggle logs" },
		{ "<leader>xc", "<cmd>XcodebuildClean<CR>",            desc = "Xcode: clean" },
		{ "<leader>xd", "<cmd>XcodebuildSelectDevice<CR>",     desc = "Xcode: select device" },
		{ "<leader>xs", "<cmd>XcodebuildSelectScheme<CR>",     desc = "Xcode: select scheme" },
		{ "<leader>xC", "<cmd>XcodebuildSelectConfig<CR>",     desc = "Xcode: select config" },
		{ "<leader>xp", "<cmd>XcodebuildSelectTestPlan<CR>",   desc = "Xcode: select test plan" },
	},
	opts = {
		integrations = {
			nvim_tree = { enabled = false },
			fzf_lua = { enabled = true },
		},
		logs = {
			auto_open_on_failed_build = true,
			auto_open_on_failed_tests = true,
			auto_close_on_success = false,
		},
	},
}
