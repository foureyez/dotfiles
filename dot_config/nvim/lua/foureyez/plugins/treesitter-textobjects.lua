return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          -- automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- you can use the capture groups defined in textobjects.scm
            ["aa"] = "@assignment.outer",
            ["ia"] = "@assignment.inner",
            ["la"] = "@assignment.lhs",
            ["ra"] = "@assignment.rhs",

            ["af"] = "@function.outer",
            ["if"] = "@function.inner",

            ["ac"] = "@class.outer",
            ["ic"] = { query = "@class.inner", desc = "select inner part of a class region" },

            ["ib"] = "@block.inner",
            ["ab"] = "@block.outer",
          },
          -- you can choose the select mode (default is charwise 'v')
          --
          -- can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'v', or '<c-v>') or a table
          -- mapping query_strings to modes.
          -- selection_modes = {
          --   ["@parameter.outer"] = "v", -- charwise
          --   ["@function.outer"] = "v", -- linewise
          --   ["@class.outer"] = "<c-v>", -- blockwise
          -- },
          -- -- if you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true of false
        },
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_nextf_end = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
        },
      },
    })
  end,
}
