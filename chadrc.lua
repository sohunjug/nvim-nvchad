---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files

M.ui = {
  theme = "kanagawa",
  theme_toggle = { "kanagawa", "everforest_light" },

  hl_override = {
    Comment = {
      italic = true,
    },
  },
  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
