local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local wk = require "which-key"

local lspconfig = require "lspconfig"

S_NVIM.lsp = S_NVIM.utils.require_dir(S_NVIM.custom_dir .. "/lsp", "custom.lsp")

local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- format & linting
    {
      "jose-elias-alvarez/null-ls.nvim",
    },
  },
  cond = [[not vim.g.vscode]],
}

local servers = { html = {}, cssls = {}, tsserver = {}, vimls = {}, dockerls = {}, bashls = {} }

local  merge = S_NVIM.utils.tb_merge
-- local merge = S_NVIM.utils.partial(vim.tbl_deep_extend, "force")

M.config = function()
  -- if you just want default config for the servers then put them in a table
  for a, ls in pairs(S_NVIM.lsp) do
    servers = merge(servers, ls)
  end

  for lsp, opts in pairs(servers) do
    lspconfig[lsp].setup(vim.tbl_deep_extend("force", {
      on_attach = on_attach,
      capabilities = capabilities,
    }, opts))
  end

  wk.register {
    ["<Leader>"] = {
      l = { name = "+Lsp" },
    },
  }

  require("core.utils").load_mappings "lspconfig"

end

return M
