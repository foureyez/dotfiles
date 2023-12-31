return {
  "simrat39/symbols-outline.nvim",
  lazy = true,
  ft = { "go", "lua", "yaml", "json" },
  config = function()
    require("symbols-outline").setup({
      keymaps = { -- These keymaps can be a string or a table for multiple keys
        code_actions = "#",
      },
      show_numbers = true,
      wrap = true,
    })

    -- Setup Keymaps
    local wk = require("which-key")
    wk.register({
      ["<leader>s"] = { "<cmd>SymbolsOutline<CR>", "Toggle Symbols Outline" },
    })
  end,
}

-- Default Shortcuts
-- Esc 	  Close outline
-- CR 	  Go to symbol location in code
-- o 	    Go to symbol location in code without losing focus
-- C+Sp 	Hover current symbol
-- K 	    Toggles the current symbol preview
-- r 	    Rename symbol
-- a 	    Code actions
-- h 	    fold symbol
-- l 	    Unfold symbol
-- W 	    Fold all symbols
-- E 	    Unfold all symbols
-- R 	    Reset all folding
-- ? 	    Show help message
