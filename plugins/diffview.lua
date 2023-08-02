local M = {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewToggleFiles", "DiffviewRefresh" },
}

M.config = function()
  require("diffview").setup()
end

return M
