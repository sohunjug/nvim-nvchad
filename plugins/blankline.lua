local M = {
  "lukas-reineke/indent-blankline.nvim",
  init = function()
    require("core.utils").lazy_load "indent-blankline.nvim"
  end,
}

M.opts = vim.tbl_deep_extend("force", require("plugins.configs.others").blankline, {

  filetype_exclude = {
    "help",
    "terminal",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "nvdash",
    "nvcheatsheet",
    "startify",
    "dashboard",
    "dotooagenda",
    "log",
    "fugitive",
    "gitcommit",
    "packer",
    "vimwiki",
    "markdown",
    "json",
    "txt",
    "vista",
    "todoist",
    "NvimTree",
    "peekaboo",
    "git",
    "lsp-installer",
    "toggleterm",
    "undotree",
    "flutterToolsOutline",
    "", -- for all buffers without a file type
  },
  buftype_exclude = { "terminal", "nofile", "" },
  context_patterns = {
    "class",
    "function",
    "method",
    "block",
    "element",
    "arguments",
    "list_literal",
    "selector",
    "^if",
    "^table",
    "if_statement",
    "^while",
    "^for",
    "^object",
  },
  char = "┊",
  char_highlight = "LineNr",
  space_char_blankline = " ",
  use_treesitter = true,
  -- space_char = "·",
  space_char = " ",
  strict_tabs = true,
  debug = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = false,
})

M.config = function()
  -- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]
  require("core.utils").load_mappings "blankline"
  dofile(vim.g.base46_cache .. "blankline")
  require("indent_blankline").setup(M.opts)
end

return M
