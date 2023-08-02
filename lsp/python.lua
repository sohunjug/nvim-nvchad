local M = {}

M.pyright = {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        -- typeCheckingMode = "off",
        diagnosticSeverityOverrides = {
          reportUndefinedVariable = false,
          reportGeneralTypeIssues = false,
        },
      },
    },
  },
  single_file_support = true,
}

return M
