local M = {
  "lukas-reineke/indent-blankline.nvim",
  -- init = function()
  --   require("core.utils").lazy_load "indent-blankline.nvim"
  -- end,
  main = "ibl",
}

M.opts = vim.tbl_deep_extend("force", require("plugins.configs.others").blankline, {

  exclude = {
    filetypes = {
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
    buftypes = { "terminal", "nofile", "quickfix", "prompt" },
  },
  -- context_patterns = {
  --   "class",
  --   "function",
  --   "method",
  --   "block",
  --   "element",
  --   "arguments",
  --   "list_literal",
  --   "selector",
  --   "^if",
  --   "^table",
  --   "if_statement",
  --   "^while",
  --   "^for",
  --   "^object",
  -- },
  indent = {
    char = "┊",
    -- char_highlight = "IblIndent",
    char_highlight = "IblScope",
  },
  -- space_char_blankline = " ",
  -- use_treesitter = true,
  -- space_char = "·",
  -- space_char = " ",
  -- strict_tabs = true,
})

M.config = function()
  -- local highlight = {
  --   "RainbowRed",
  --   "RainbowYellow",
  --   "RainbowBlue",
  --   "RainbowOrange",
  --   "RainbowGreen",
  --   "RainbowViolet",
  --   "RainbowCyan",
  -- }
  --
  -- local hooks = require "indent-blankline.hooks"
  -- M.opts.indent = { highlight = highlight }
  --
  -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  --   vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  --   vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  --   vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  --   vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  --   vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  --   vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  --   vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
  -- end)

  require("core.utils").load_mappings "blankline"
  -- dofile(vim.g.base46_cache .. "blankline")
  require("indent_blankline").setup(M.opts)
  -- require("ibl").setup(M.opts)
end

return M
