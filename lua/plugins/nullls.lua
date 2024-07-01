local M = {
  "nvimtools/none-ls.nvim",
  -- enable = false,
}

M.config = function()
  local present, nls = pcall(require, "null-ls")

  if not present then
    return
  end

  local b = nls.builtins
  local nls_utils = require "null-ls.utils"

  local sources = {

    b.diagnostics.protolint,
    b.diagnostics.shellcheck.with {
      diagnostics_format = "[#{c}] #{m} (#{s})",
    },
    b.formatting.buf,
    b.diagnostics.zsh,
    -- Lua
    b.formatting.jq,
    b.formatting.nginx_beautifier,
    b.formatting.sql_formatter,
    b.formatting.beautysh,
    b.formatting.terraform_fmt,
    -- cpp
    b.code_actions.gitsigns,
    b.code_actions.shellcheck,

    b.hover.dictionary,
  }

  nls.setup {
    debug = true,
    debounce = 150,
    notify_format = "[null-ls] %s",
    update_in_insert = true,
    root_dir = nls_utils.root_pattern ".git",
    sources = sources,
  }
end

M.opts = function(_, opts)
  local nls = require "null-ls"
  opts.sources = vim.list_extend(opts.sources or {}, {
    nls.builtins.code_actions.gomodifytags,
    nls.builtins.code_actions.impl,
  })
  return opts
end

return M
