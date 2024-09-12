local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local wk = require "which-key"
local utils = require "utils"

local lspconfig = require "lspconfig"

local lsps = utils.require_dir(vim.fn.stdpath "config" .. "/lua/lsp", "lsp")

local M = {
  "neovim/nvim-lspconfig",
  event = "User FilePost",
  dependencies = {
    -- format & linting
    -- {
    "kcl-lang/kcl.nvim",
    --   "jose-elias-alvarez/null-ls.nvim",
    -- },
  },
  cond = [[not vim.g.vscode]],
}

local configs = require "lspconfig.configs"

if not configs.kcl then
  configs.kcl = {
    default_config = {
      cmd = { "kcl-language-server" },
      filetypes = { "kcl" },
      -- root_dir = util.path.dirname,
      -- root_dir = lspconfig.util.root_pattern ".git",
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname)
      end,
      settings = {},
    },
    -- on_new_config = function(new_config) end;
    -- on_attach = function(client, bufnr) end;
    docs = {
      default_config = {
        root_dir = [[root_pattern(".git")]],
      },
    },
  }
end

local servers = { html = {}, cssls = {}, ts_ls = {}, vimls = {}, dockerls = {}, bashls = {} }

local merge = utils.tb_merge
-- local merge = S_NVIM.utils.partial(vim.tbl_deep_extend, "force")
-- M.init = function()
-- local util = require "lspconfig/util"

-- end

M.config = function()
  require("nvchad.configs.lspconfig").defaults()
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

  wk.add {
    { "<Leader>l", { group = "Lsp" } },
  }

  --require("core.utils").load_mappings "lspconfig"
end

return M
