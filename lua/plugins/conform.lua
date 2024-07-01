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
      typescript = { { "prettier", "eslint" } },
      python = { "isort", "black" },
      go = { "goimports", "gofumpt" },
      c = { "clang-format" },
      sh = { "beautysh" },
      cmake = { "cmake-format" },
      rust = { "rustfmt" },
      protobuf = { "buf" },
      json = { "jq" },
      xml = { "prettierd" },
      nix = { "nixfmt" },
      terraform = { "terraform" },
      yaml = { "yamlfmt" },
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
