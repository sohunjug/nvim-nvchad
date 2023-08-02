local M = {
  "jose-elias-alvarez/null-ls.nvim",
}

M.config = function()
  local present, null_ls = pcall(require, "null-ls")

  if not present then
    return
  end

  local b = null_ls.builtins
  local nls_utils = require "null-ls.utils"

  local sources = {

    b.diagnostics.protolint,
    b.diagnostics.shellcheck.with {
      diagnostics_format = "[#{c}] #{m} (#{s})",
    },
    b.formatting.black,
    b.formatting.buf,
    b.diagnostics.zsh,
    -- webdev stuff
    b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
    b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

    -- Lua
    b.formatting.stylua.with {
      extra_args = {
        "--config-path",
        vim.fn.stdpath "config" .. "/.stylua.toml",
        -- "-",
      },
    },
    b.formatting.clang_format,
    b.formatting.cmake_format,

    b.formatting.gofumpt,
    b.formatting.goimports,
    b.formatting.jq,
    b.formatting.nginx_beautifier,
    b.formatting.sql_formatter,
    b.formatting.beautysh,
    b.formatting.prettier_d_slim.with {
      filetypes = {
        "typescriptreact",
        "typescript",
        "javascriptreact",
        "javascript",
        "svelte",
        -- "json",
        -- "jsonc",
        "scss",
        "vue",
        "yaml",
      },
    },
    b.formatting.terraform_fmt,
    -- cpp
    b.formatting.clang_format,

    b.code_actions.gitsigns,
    b.code_actions.shellcheck,

    b.hover.dictionary,
  }

  null_ls.setup {
    debug = true,
    debounce = 150,
    notify_format = "[null-ls] %s",
    update_in_insert = true,
    root_dir = nls_utils.root_pattern ".git",
    sources = sources,
  }
end

return M
