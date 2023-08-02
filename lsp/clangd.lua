local M = {}
local util = require "lspconfig.util"

M.clangd = {
   cmd = {
      "clangd",
      "--background-index",
      "--suggest-missing-includes",
      "--pch-storage=memory",
      "--clang-tidy",
      "--header-insertion=iwyu",
   },
   filetypes = { "c", "cpp", "objc", "objcpp" },
   root_dir = util.root_pattern("build/compile_commands.json", "compile_commands.json", "compile_flags.txt", ".git"),
}

return M
