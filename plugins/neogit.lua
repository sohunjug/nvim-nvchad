local M = {
  "TimUntersberger/neogit",

  cmd = "Neogit",
}

M.config = function()
  require("neogit").setup { integrations = { diffview = true, auto_refresh = true } }
end

return M
