local M = {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
    "nvim-lua/plenary.nvim",
  },
}

M.config = function()
  local crates = require "crates"
  crates.setup { null_ls = {
    enabled = true,
    name = "crates.nvim",
  } }
  require("core.utils").load_mappings "crates"
end

return M
