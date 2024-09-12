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
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          "/Applications/Hammerspoon.app/Contents/Resources/extensions/hs/?/?.lua",
          "${3rd}/luv/library",
          "/opt/homebrew/share/luajit-2.1/jit",
        },
        checkThirdParty = false,
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

return M
