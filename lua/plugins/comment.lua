local M = {
  "numToStr/Comment.nvim",
}

M.keys = {
  { "gcc", mode = "n",          desc = "Comment toggle current line" },
  { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
  { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
  { "gbc", mode = "n",          desc = "Comment toggle current block" },
  { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
  { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
}
M.init = function()
  require("utils").load_mappings "comment"
end
M.config = function(_, opts)
  require("Comment").setup(opts)
end

return M
