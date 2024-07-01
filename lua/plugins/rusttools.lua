local M = {
  "simrat39/rust-tools.nvim",
  -- ft = "rust",
  -- event = { "BufRead Cargo.toml" },
  enable = false,
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

M.opts = function(_, _)
  require("rust-tools").setup {}
  require("rust-tools").open_cargo_toml.open_cargo_toml()
  require("rust-tools").hover_actions.hover_actions()
end

return M
