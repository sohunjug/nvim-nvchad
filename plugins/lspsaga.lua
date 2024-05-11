local M = {
  event = "LspAttach",
  "nvimdev/lspsaga.nvim",
}

M.config = function()
  require("lspsaga").setup {}
end

M.dependencies = {
  "nvim-treesitter/nvim-treesitter", -- optional
  "nvim-tree/nvim-web-devicons", -- optional
}

return M
