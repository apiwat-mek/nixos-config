return {
  "CRAG666/code_runner.nvim",
  cmd = { "RunCode", "RunFile", "RunProject" },
  config = function()
    require("code_runner").setup({
      mode = "term",
      focus = true,
      startinsert = false,
      term = {
        position = "botright",
        size = 12,
      },
      filetype = {
        cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
        python = "python3 -u $fileName",
        c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
      },
    })
  end,
}
