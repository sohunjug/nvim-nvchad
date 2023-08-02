---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>b"] = "",
    ["<leader>h"] = "",
    ["h"] = "",
    ["e"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["Q"] = { "q", "quick", opts = { nowait = true } },
    ["q"] = { "<cmd> q <cr>", "quit", opts = { nowait = true } },
    -- ["<leader>b"] = {name = "+Buffer"},
    ["<leader>bf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
    ["<leader>cl"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
    ["<leader>gn"] = {
      "<cmd> Neogit <cr>",
      "Neogit",
      opts = { nowait = true },
    },
    ["<leader>H"] = { "<cmd> Alpha <cr>", "Home Start", opts = { nowait = true } },
    ["<leader>ba"] = {
      function()
        require("nvchad_ui.tabufline").closeAllBufs()
      end,
      "Close All Buffers",
      opts = { nowait = true },
    },
    ["<leader>bd"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close Buffer",
      opts = { nowait = true },
    },
    ["<leader>bn"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "Buffer Next",
      opts = { nowait = true },
    },
    ["<leader>bo"] = {
      function()
        require("nvchad_ui.tabufline").closeOtherBufs()
      end,
      "Buffer Only",
      opts = { nowait = true },
    },
    ["<leader>bp"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "Buffer Prev",
      opts = { nowait = true },
    },
    ["<leader>u"] = {
      "<cmd> UndotreeToggle <cr>",
      "UndoTree",
      opts = { nowait = true },
    },
    ["<leader>he"] = {
      ":%!xxd -r<cr>",
      "ToAscii",
      opts = { nowait = true },
    },
    ["<leader>hh"] = {
      ":%!xxd<cr>",
      "ToHex",
      opts = { nowait = true },
    },
  },

  v = {
    ["<leader>cl"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
    ["<M-[>2;5+"] = {
      ':"+y<cr>',
      "CopyToOS",
    },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["<leader>fr"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["ep"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["en"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    ["<leader>ft"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    -- focus
    ["<leader>fo"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.hop = {
  plugin = true,
  n = {
    ["<leader>hw"] = { "<cmd> HopWord <cr>", "HopWord" },
    ["<leader>haw"] = { "<cmd> HopWordMW <cr>", "HopWordMW" },
    ["<leader>hc"] = { "<cmd> HopChar1 <cr>", "HopChar" },
    ["<leader>hac"] = { "<cmd> HopChar1MW <cr>", "HopCharMW" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ts"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Document Symbols" },
    ["<leader>tr"] = { "<cmd> Telescope lsp_references <CR>", "References" },
  },
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>ct"] = {
      function()
        require("crates").toggle()
      end,
      "Toggle Crates",
    },
    ["<leader>cr"] = {
      function()
        require("crates").reload()
      end,
      "Reload Crates",
    },
    ["<leader>cf"] = {
      function()
        require("crates").show_features_popup()
      end,
      "Crates Features",
    },
    ["<leader>cv"] = {
      function()
        require("crates").show_versions_popup()
      end,
      "Crates Versions",
    },
    ["<leader>cd"] = {
      function()
        require("crates").show_dependencies_popup()
      end,
      "Crates Dependencies",
    },
    ["<leader>cu"] = {
      function()
        require("crates").update_crate()
      end,
      "Crates Update",
    },
    ["<leader>cH"] = {
      function()
        require("crates").open_homepage()
      end,
      "Crates HomePage",
    },
    ["<leader>cR"] = {
      function()
        require("crates").open_repository()
      end,
      "Crates Repository",
    },
    ["<leader>cD"] = {
      function()
        require("crates").open_documentation()
      end,
      "Crates Documentation",
    },
    ["<leader>cC"] = {
      function()
        require("crates").open_crates_io()
      end,
      "Crates io",
    },
  },
  -- vim.keymap.set("n", "<leader>ce", crates.expand_plain_crate_to_inline_table, opts)
  -- vim.keymap.set("n", "<leader>cE", crates.extract_crate_into_table, opts)
  --
  -- vim.keymap.set("n", "<leader>cH", crates.open_homepage, opts)
  -- vim.keymap.set("n", "<leader>cR", crates.open_repository, opts)
  -- vim.keymap.set("n", "<leader>cD", crates.open_documentation, opts)
  -- vim.keymap.set("n", "<leader>cC", crates.open_crates_io, opts)
}

return M
