return {
	"gelguy/wilder.nvim",
	config = function()
		local wilder = require("wilder")
		wilder.setup({ modes = { ":", "/", "?" } })
		wilder.set_option("pipeline", {
			wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline()),
		})

		local highlighters = {
			wilder.pcre2_highlighter(),
			wilder.basic_highlighter(),
		}

		wilder.set_option(
			"renderer",
			wilder.renderer_mux({
				[":"] = wilder.popupmenu_renderer({
					highlighter = highlighters,
				}),
				["/"] = wilder.wildmenu_renderer({
					highlighter = highlighters,
				}),
			})
		)
	end,
}
