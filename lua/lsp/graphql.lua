local util = require "lspconfig.util"
local M = {}

M.graphql = {
  root_dir = util.root_pattern(".graphqlrc.yml", ".qraphqlrc"),
}

return M
