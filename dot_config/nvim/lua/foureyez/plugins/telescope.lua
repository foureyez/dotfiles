return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-project.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      extensions_list = { "project" },
      extensions = {
        project = {
          theme = "dropdown",
          order_by = "asc",
          sync_with_nvim_tree = true, -- default false
          on_project_selected = function(prompt_bufnr)
            local project_actions = require("telescope._extensions.project.actions")
            project_actions.change_working_directory(prompt_bufnr, false)
            require("telescope.builtin").find_files()
          end,
        },
      },
    })
    -- Setup Keymaps
    local wk = require("which-key")
    wk.register({
      ["<leader>f"] = {
        name = "+file",
        f = { "<cmd>Telescope find_files<CR>", "Find Files" },
        a = { "<cmd> Telescope live_grep<CR>", "Live Grep" },
      },
      ["<leader>p"] = {
        function()
          telescope.extensions.project.project({})
        end,
        "Switch Project",
      },
    })
  end,
}
