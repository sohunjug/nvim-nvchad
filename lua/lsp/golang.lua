local M = {}

M.gopls = {
  cmd = { "gopls", "--remote=auto" },
  filetypes = { "go", "gomod" },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    buildFlags = { "-tags=wireinject" },
  },
  setting = {
    gopls = {
      buildFlags = { "-tags=wireinject" },
      usePlaceholders = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      analyses = {
        fieldalignment = true,
        nilness = true,
        shadow = true,
        unusedparams = true,
        unusewrites = true,
      },
      staticcheck = true,
      completeUnimported = true,
      semanticTokens = true,
      odelenses = {
        references = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        generate = true,
      },
      gofumpt = true,
      directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules", "-.nvim" },
    },
  },
}

return M
