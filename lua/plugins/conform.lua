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
      rust = { "rustfmt", lsp_format = "fallback" },
      protobuf = { "buf" },
      json = { "jq" },
      xml = { "prettierd" },
      nix = { "nixfmt" },
      terraform = { "terraform" },
      yaml = { "yamlfmt" },
      kcl = { "kcl" },
    },
    formatters = {
      kcl = {
        command = "kcl",
        args = { "fmt", "$FILENAME" },
        stdin = false,
      },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    notify_no_formatters = true,
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
