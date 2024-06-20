local M = {}

M.lua_ls = {
  settings = {
    Lua = {
      completion = {
        enable = true,
        callSnippet = "Replace",
      },
      telemetry = {
        enable = false,
      },
      diagnostics = {
        enable = true,
        globals = { "vim", "hs", "S_NVIM", "S_HS_CONFIG" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/extensions/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          ["/Applications/Hammerspoon.app/Contents/Resources/extensions/hs/?/?.lua"] = true,
          ["/opt/homebrew/share/luajit-2.1.0-beta3/jit"] = true,
        },
        checkThirdParty = true,
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

return M
