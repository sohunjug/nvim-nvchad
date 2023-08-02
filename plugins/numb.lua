local M = {
  "nacro90/numb.nvim",
  event = { "BufRead" },
}

M.config = function()
  require("numb").setup { show_numbers = true, show_currorline = true, number_only = false }
end

return M
