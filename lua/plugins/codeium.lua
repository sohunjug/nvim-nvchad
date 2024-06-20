local M = {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "Exafunction/codeium.vim",
  },
  event = "BufEnter",
}

M.config = function()
  vim.keymap.set("i", "<C-g>", function()
    return vim.fn["codeium#Accept"]()
  end, { expr = true })
  vim.keymap.set("i", "<c-;>", function()
    return vim.fn["codeium#CycleCompletions"](1)
  end, { expr = true })
  vim.keymap.set("i", "<c-,>", function()
    return vim.fn["codeium#CycleCompletions"](-1)
  end, { expr = true })
  vim.keymap.set("i", "<c-h>", function()
    return vim.fn["codeium#Complete"]()
  end, { expr = true })
  vim.keymap.set("i", "<c-x>", function()
    return vim.fn["codeium#Clear"]()
  end, { expr = true })
  require("codeium").setup { enterprise_mode = false, enable_chat = true }
end

return M
