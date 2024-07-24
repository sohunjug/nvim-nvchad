local M = {
  "simrat39/rust-tools.nvim",
  ft = "rust",
  -- event = { "BufRead Cargo.toml" },
  -- enable = false,
  -- ft = function(_, filetype)
  --   local name = vim.fn.expand "%:t"
  --
  --   print(vim.inspect(filetype))
  --   if vim.g.vscode then
  --     return false
  --   elseif filetype == "rust" then
  --     return true
  --   elseif filetype == "toml" and name == "Cargo.toml" then
  --     return true
  --   end
  --   return false
  -- end,
}

M.config = function(_, _)
  local on_init = require("nvchad.configs.lspconfig").on_init
  local on_attach = require("nvchad.configs.lspconfig").on_attach
  local utils = require "utils"
  local capabilities = require("nvchad.configs.lspconfig").capabilities

  local rust_analyzer = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      utils.load_mappings("lspconfig", { buffer = bufnr })
    end,
    on_init = on_init,
    capabilities = capabilities,
    standalone = true,
    procMacro = { enable = true },
    imports = {
      granularity = {
        group = "module",
      },
      prefix = "self",
    },
    cargo = {
      allFeatures = true,
      buildScripts = {
        enable = true,
      },
    },
    checkOnSave = {
      command = "clippy",
      -- extraArgs = { "--no-deps" },
    },
    diagnostics = {
      enable = false,
    },
  }
  local opts = {
    tools = {
      -- runnables = {
      --   use_telescope = true,
      -- },
      inlay_hints = {
        auto = true,
        show_parameter_hints = true,
        parameter_hints_prefix = "<- ",
        other_hints_prefix = "=> ",
      },
      hover_actions = {

        -- the border that is used for the hover window
        -- see vim.api.nvim_open_win()
        border = {
          { "╭", "FloatBorder" },
          { "─", "FloatBorder" },
          { "╮", "FloatBorder" },
          { "│", "FloatBorder" },
          { "╯", "FloatBorder" },
          { "─", "FloatBorder" },
          { "╰", "FloatBorder" },
          { "│", "FloatBorder" },
        },

        -- Maximal width of the hover window. Nil means no max.
        max_width = nil,

        -- Maximal height of the hover window. Nil means no max.
        max_height = nil,

        -- whether the hover action window gets automatically focused
        -- default: false
        auto_focus = false,
      },
    },
    server = rust_analyzer,
    dap = {
      adapter = {
        type = "executable",
        command = "lldb-vscode",
        name = "rt_lldb",
      },
    },
  }

  require("rust-tools").setup(opts)
  -- require("rust-tools").setup {}
  -- require("rust-tools").open_cargo_toml.open_cargo_toml()
  -- require("rust-tools").hover_actions.hover_actions()
end

return M
