local M = {
  "stevearc/conform.nvim",
  lazy = false,
  -- event = 'BufWritePre', -- uncomment for format on save
}

M.config = function()
  local options = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettier" },
      html = { "prettier" },
      javascript = { { "prettierd", "prettier" } },
      python = { "isort", "black" },
      go = { "goimports", "gofumpt" },
    },
    -- formatters = {
    --   ["goimports-reviser"] = {
    --     prepend_args = { "-rm-unused" },
    --     stdin = true,
    --   },
    -- },
  }

  require("conform").setup(options)
end
return M
