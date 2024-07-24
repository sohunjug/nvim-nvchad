local util = require("lspconfig.util")
local M = {}

M.kcl = {
  cmd = { "kcl-language-server" },
  filetypes = { "kcl" },
  root_dir = util.root_pattern ".git",
}

return M
