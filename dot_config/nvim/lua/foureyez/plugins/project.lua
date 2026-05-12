return {
  -- {
  --   "coffebar/neovim-project",
  --   dependencies = {
  --     { "nvim-lua/plenary.nvim" },
  --     -- optional picker
  --     { "ibhagwan/fzf-lua" },
  --     { "Shatur/neovim-session-manager" },
  --   },
  --   lazy = false,
  --   priority = 100,
  --   keys = {
  --     { "<leader>;", "<cmd>NeovimProjectDiscover<CR>", desc = "Discover projects" },
  --   },
  --   opts = {
  --     projects = { -- define project roots
  --       -- "~/workspace/*",
  --       "~/workspace/*",
  --       "~/personal_workspace/*",
  --       "~/.local/share/chezmoi",
  --     },
  --     picker = {
  --       type = "fzf-lua",
  --       preview = {
  --         enabled = false,
  --       },
  --       opts = {
  --         winopts = {
  --           width = 0.4,
  --           height = 0.5,
  --         },
  --       },
  --     },
  --     -- sessionoptions (including globals) already set in core/options.lua
  --   },
  -- },

  {
    dir = vim.fn.stdpath("config") .. "/lua/foureyez/local/project_switcher",
    name = "project-switcher",
    dependencies = { "ibhagwan/fzf-lua" },
    keys = {
      { "<leader>;", "<cmd>ProjectSwitch<CR>", desc = "Project picker" },
    },
    cmd = { "ProjectSwitch", "DiscoverProject", "DiscoverProjects" },
    config = function()
      require("project_switcher").setup({
        roots = {
          "~/workspace/*",
          "~/personal_workspace/*",
          "~/.local/share/chezmoi",
        },
        recursive = true,
        max_depth = 2,
        root_markers = {
          ".git",
        },
        picker = {
          winopts = {
            width = 0.45,
            height = 0.4,
            row = 0.35,
          },
        },
        session = {
          enabled = true,
        },
      })
    end,
  },
}
