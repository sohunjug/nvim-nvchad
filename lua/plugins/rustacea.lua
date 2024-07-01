local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local M = {
  "mrcjkb/rustaceanvim",
  version = "^4", -- Recommended
  -- lazy = false, -- This plugin is already lazy
  enable = false,
}

M.init = function()
  vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {},
    -- LSP configuration
    server = {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
      default_settings = {
        -- rust-analyzer language server configuration
        ["rust-analyzer"] = {},
      },
    },
    -- DAP configuration
    dap = {},
  }
end

return M
