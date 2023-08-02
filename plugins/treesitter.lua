local M = {
  "nvim-treesitter/nvim-treesitter",
  cond = [[not vim.g.vscode]],
}

M.opts = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "cpp",
    "go",
    "vue",
    "rust",
    "json",
    "java",
    "bash",
    "python",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    disable = {
      "python",
    },
  },
}

return M
