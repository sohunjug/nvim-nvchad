local M = {}

M.pyright = {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        venvPath = "~/.virtualenvs",
        -- typeCheckingMode = "off",
        diagnosticSeverityOverrides = {
          strictListInference = false,
          strictDictionaryInference= false,
          strictSetInference = false,
          reportUndefinedVariable = false,
          reportGeneralTypeIssues = false,
          reportMissingImports = true,
          reportMissingTypeStubs= false,
          reportReturnType = "warning",
          reportArgumentType = "warning",
          reportAssignmentType = "warning",
          reportAttributeAccessIssue = "warning",
        },
      },
    },
  },
  single_file_support = true,
}

return M
