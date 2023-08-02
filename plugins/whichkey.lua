local wk = require "which-key"

local M = {
  "folke/which-key.nvim",
}

M.config = function()
  wk.setup {
    plugins = {
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = true,
        g = true,
      },
    },

    icons = {
      breadcrumb = "»",
      separator = "│",
      group = "+",
    },

    window = {
      border = "none",
      position = "bottom",
      margin = { 1, 0, 1, 0 },
      padding = { 1, 1, 1, 1 },
      winblend = 0,
    },
  }
  wk.register {
    ["<Leader>"] = {
      b = { name = "+Buffer" },
      c = { name = "+Comment" },
      f = { name = "+File" },
      g = { name = "+Git" },
      h = { name = "+Hop" },
      m = { name = "+Bookmark" },
      r = { name = "+Num" },
      t = { name = "+Telescope" },
      p = { name = "+Pick" },
      w = { name = "+Window" },
    },
  }
end

return M
