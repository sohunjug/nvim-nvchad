local util = require "lspconfig.util"
local M = {}

M.rnix = {
  root_dir = util.root_pattern("flake.nix", ".git"),
}

return M
