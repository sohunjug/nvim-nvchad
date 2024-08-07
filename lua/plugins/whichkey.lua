-- local wk = require "which-key"

local M = {
  "folke/which-key.nvim",

  dependencies = {
    "echasnovski/mini.icons",
  },
  event = "VeryLazy",
}

M.init = function()
  require("utils").load_mappings "whichkey"
end

M.opts = {
  plugins = {
    presets = {
      operators = true,
      motions = true,
      text_objects = false,
      windows = false,
      nav = false,
      z = true,
      g = true,
      y = true,
      c = true,
      d = true,
    },
  },

  -- icons = {
  --   breadcrumb = "»",
  --   separator = "│",
  --   group = "+",
  -- },

  win = {
    border = "none",
    -- position = "bottom",
    -- margin = { 1, 0, 1, 0 },
    padding = { 1, 2 },
    title = true,
    -- width = 100,
    wo = {
      winblend = 0,
    },
  },
}
-- wk.register {
--   ["<Leader>"] = {
--     b = { group = "+Buffer" },
--     c = { group = "+Comment" },
--     f = { group = "+File" },
--     g = { group = "+Git" },
--     h = { group = "+Hop" },
--     m = { group = "+Bookmark" },
--     r = { group = "+Num" },
--     t = { group = "+Telescope" },
--     p = { group = "+Pick" },
--     w = { group = "+Window" },
--   },
-- }
M.keys = {
  { "<Leader>b", group = "Buffer" },
  { "<Leader>c", group = "Comment" },
  { "<Leader>f", group = "File" },
  { "<Leader>g", group = "Git" },
  { "<Leader>h", group = "Hop" },
  { "<Leader>m", group = "Bookmark" },
  { "<Leader>p", group = "Pick" },
  { "<Leader>r", group = "Num" },
  { "<Leader>t", group = "Telescope" },
  { "<Leader>w", group = "Window" },
}

return M
