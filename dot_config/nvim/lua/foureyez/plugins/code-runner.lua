return {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      startinsert = true,
      filetype = {
        python = "python3 -u",
        typescript = "deno run",
        rust = {
          "cd $dir &&",
          "rustc $fileName &&",
          "$dir/$fileNameWithoutExt",
        },
        go = {
          "go run $dir/$fileName",
        },
      },
      project = {
        ["~/workspace/lp-aws-workflow-manager"] = {
          name = "aws workflow manager",
          command = "go run cmd/main.go",
          mode = "tab",
        },
      },
      -- project_path = vim.fn.expand("~/workspace/project_runner.json"),
    })
  end,
}
