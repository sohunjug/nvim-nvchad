local M = {
  "kdheepak/lazygit.nvim",
	cmd = { "LazyGit", "LazyGitConfig" },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
}

M.config = function()
  vim.g.lazygit_floating_window_winblend = 0 --" transparency of floating window
  vim.g.lazygit_floating_window_scaling_factor = 0.9 --" scaling factor for floating window
  vim.g.lazygit_floating_window_corner_chars = { "╭", "╮", "╰", "╯" } --" customize lazygit popup window corner characters
  vim.g.lazygit_floating_window_use_plenary = 0 --" use plenary.nvim to manage floating window if available
  vim.g.lazygit_use_neovim_remote = 0 --" fallback to 0 if neovim-remote is not installed
  require("telescope").load_extension "lazygit"
end

return M
