S_NVIM = {}

local opt = vim.opt
local g = vim.g

S_NVIM.custom_dir = vim.fn.stdpath('config') .. "/lua/custom"
S_NVIM.utils = require"custom.utils"

opt.fileformats = "unix,mac,dos"

opt.fencs = {
   "utf-8",
   -- "ucs-bom",
   -- "shift-jis",
   "gb18030",
   "gbk",
   "gb2312",
}
      -- clipboard = "unnamedplus",
opt.wildignorecase = true
      -- wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
opt.wildignore = {
   "*.o",
   "*.a",
   "*.out",
   "*.class",
   "*.mo",
   "*.la",
   "*.so",
   "*.obj",
   "*.swp",
   ".tern-port",
   "*.tmp",
   "*.jpg",
   "*.jpeg",
   "*.png",
   "*.xpm",
   "*.gif",
   "*.bmp",
   "*.ico",
   "*.pyc",
   "*.zip",
   ".git",
   ".hg",
   ".svn",
   "CVS",
   "**/node_modules/**",
   "**/bower_modules/**",
   "**/tmp/**",
   "package-lock.json",
   "yarn.lock",
   "composer.lock",
   "DS_Store",
}

-- opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←,eol:↴,space:⋅"
opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←,eol:↴"
-- opt.listchars = "tab:»·,eol:↴"

opt.list = true

g.mapleader = " "

if vim.fn.has "gui" then
  -- vim.g.guifont = "FiraCode Nerd Font Mono:h13"
  vim.g.guifont = "JetBrainsMono Nerd Font Mono:h13"
end
-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-------------------------------------- commands ------------------------------------------
local new_cmd = vim.api.nvim_create_user_command

new_cmd("NvChadUpdate", function()
  require "nvchad.update"()
end, {})
-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
