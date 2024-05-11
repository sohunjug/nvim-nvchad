local M = {
  "hrsh7th/nvim-cmp",
}

M.event = "InsertEnter"
M.dependencies = {
  {
    -- snippet plugin
    "L3MON4D3/LuaSnip",
    dependencies = "rafamadriz/friendly-snippets",
    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
    config = function(_, opts)
      require("plugins.configs.others").luasnip(opts)
    end,
  },

  -- autopairing of (){}[] etc
  {
    "windwp/nvim-autopairs",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      -- setup cmp for autopairs
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- cmp sources plugins
  {
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
}

M.opts = function()
  _opts = require "plugins.configs.cmp"
  _opts.sources = {
    { name = "codeium", offset = 1 },
    { name = "nvim_lsp", offset = 2 },
    { name = "luasnip", offset = 3 },
    { name = "buffer", offset = 3 },
    { name = "nvim_lua", offset = 3 },
    { name = "path", offset = 3 },
  }
  return _opts
end

M.config = function(_, opts)
  require("cmp").setup(opts)
end

return M
