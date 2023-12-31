local M = {
  "yamatsum/nvim-cursorline",
  disable = true,
  -- event = { "BufReadPre", "BufNewFile" },
}

M.config = function()
  require("nvim-cursorline").setup {
    cursorline = {
      enable = true,
      timeout = 1000,
      number = false,
    },
    cursorword = {
      enable = true,
      min_length = 3,
      hl = { underline = true },
    },
  }
end

return M
