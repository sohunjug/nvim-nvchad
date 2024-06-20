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
      analyses = {
        nilness = true,
        shadow = true,
        unusedparams = true,
        unusewrites = true,
      },
      staticcheck = true,
      odelenses = {
        references = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        generate = true,
      },
      gofumpt = true,
    },
  },
}

return M
