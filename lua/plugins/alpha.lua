local M = {
  "goolord/alpha-nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

M.config = function()
  require("alpha").setup(require("alpha.themes.startify").config)
end

return M
