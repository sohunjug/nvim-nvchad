local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local wk = require "which-key"
local utils = require "utils"

local lspconfig = require "lspconfig"

local lsps = utils.require_dir(vim.fn.stdpath "config" .. "/lua/lsp", "lsp")

local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- format & linting
    -- {
    --   "jose-elias-alvarez/null-ls.nvim",
    -- },
  },
  cond = [[not vim.g.vscode]],
}

local servers = { html = {}, cssls = {}, tsserver = {}, vimls = {}, dockerls = {}, bashls = {} }

local merge = utils.tb_merge
-- local merge = S_NVIM.utils.partial(vim.tbl_deep_extend, "force")

M.config = function()
  -- if you just want default config for the servers then put them in a table
  for _, ls in pairs(lsps) do
    servers = merge(servers, ls)
  end

  for lsp, opts in pairs(servers) do
    lspconfig[lsp].setup(vim.tbl_deep_extend("force", {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        utils.load_mappings("lspconfig", { buffer = bufnr })
      end,
      on_init = on_init,
      capabilities = capabilities,
    }, opts))
  end

  wk.register {
    ["<Leader>"] = {
      l = { name = "+Lsp" },
    },
  }

  --require("core.utils").load_mappings "lspconfig"
end

return M
