local M = {}

M.rust_analyzer = {
  setting = {
    ["rust-analyzer"] = {
      procMacro = { enable = true },
      cargo = { allFeatures = true },
      checkOnSave = {
        command = "clippy",
        extraArgs = { "--no-deps" },
      },
      diagnostics = {
        enable = false,
      },
    },
  },
}

return M
