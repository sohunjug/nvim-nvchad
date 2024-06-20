local M = {
  "max397574/better-escape.nvim",
  event = "InsertEnter",
}

M.config = function()
  require("better_escape").setup()
end

return M
