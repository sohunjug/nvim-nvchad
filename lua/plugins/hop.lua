local M = {
  "phaazon/hop.nvim",
  branch = "v2", -- optional but strongly recommended
  event = { "BufReadPost" },
}

M.init = function ()
  require("utils").load_mappings("hop")
end

M.config = function()
  -- you can configure Hop the way you like here; see :h hop-config
  --require("core.utils").load_mappings "hop"
  require("hop").setup {}
end

return M
