local M = {
  "williamboman/mason.nvim",
}

M.opts = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    "js-debug-adapter",
    "prettier",
    "bash-debug-adapter",
    "go-debug-adapter",
    "java-debug-adapter",
    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "gopls",
    "autoflake",
    "black",
    "bash-language-server",
    "beautysh",
    "buf",
    "buf-language-server",
    "checkstyle",
    "shellcheck",
    "cmake-language-server",
    "cmakelint",
    "cpplint",
    "dockerfile-language-server",
    "docker-compose-language-server",
    "eslint_d",
    "gofumpt",
    "goimports",
    "gopls",
    "helm-ls",
    "llm-ls",
    "isort",
    "jq",
    "jdtls",
    "json-lsp",
    "vscode-json-language-server",
    "luaformatter",
    "mdformat",
    "nginx-language-server",
    "pyright",
    "rnix-lsp",
    "rust-analyzer",
    "sql-formatter",
    "sqlfmt",
    "sqlls",
    "terraform-ls",
    "yaml-language-server",
    "yamlfmt",
    "yapf",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

return M
