local M = {
  "phaazon/hop.nvim",
  branch = "v2", -- optional but strongly recommended
  event = { "BufEnter" },
}

M.config = function()
  -- you can configure Hop the way you like here; see :h hop-config
  require("core.utils").load_mappings "hop"
  require("hop").setup {}
end

return M
