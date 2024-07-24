local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local M = {
  "mrcjkb/rustaceanvim",
  version = "^4", -- Recommended
  -- ft = { "rust" },
  enable = false,
}

M.opts = {
  server = {
    on_init = on_init,
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      -- register which-key mappings
      on_attach(client, bufnr)
      local wk = require "which-key"
      wk.register({
        ["<leader>cR"] = {
          function()
            vim.cmd.RustLsp "codeAction"
          end,
          "Code Action",
        },
        ["<leader>dr"] = {
          function()
            vim.cmd.RustLsp "debuggables"
          end,
          "Rust debuggables",
        },
      }, { mode = "n", buffer = bufnr })
    end,
    settings = {
      -- rust-analyzer language server configuration
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        -- Add clippy lints for Rust.
        checkOnSave = {
          allFeatures = true,
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
        procMacro = {
          enable = true,
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" },
          },
        },
      },
    },
  },
}
M.config = function(_, opts)
  vim.g.rustaceanvim = vim.tbl_deep_extend("force", {}, opts or {})
end
return M
