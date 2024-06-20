require "nvchad.options"

local opt = vim.opt
local g = vim.g

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
opt.history = 2000
opt.colorcolumn = "120"

g.mapleader = " "
-- g.loaded_python3_provider = 1
-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

if vim.fn.has "gui" then
  -- vim.g.guifont = "FiraCode Nerd Font Mono:h13"
  g.guifont = "JetBrainsMonoNL Nerd Font:h12"
end

if g.neovide then
  opt.linespace = 0

  -- g.neovide_theme = "dark"
  g.neovide_scale_factor = 1.0
  g.neovide_padding_top = 0
  g.neovide_padding_bottom = 0
  g.neovide_padding_right = 0
  g.neovide_padding_left = 0

  g.neovide_window_blurred = true

  -- g.neovide_floating_blur_amount_x = 2.0
  -- g.neovide_floating_blur_amount_y = 2.0

  g.neovide_transparency = 0.8
  g.transparency = 0.8

  g.neovide_scroll_animation_length = 0
  g.neovide_scroll_animation_far_lines = 1

  g.neovide_refresh_rate = 120
  g.neovide_remember_window_size = true

  g.neovide_profiler = false
  g.neovide_input_macos_option_key_is_meta = true

  -- g.neovide_touch_deadzone = 3.0

  g.neovide_cursor_vfx_mode = "sonicboom"
  g.neovide_cursor_animate_in_insert_mode = false
  g.neovide_cursor_animate_command_line = false
  g.neovide_cursor_smooth_blink = false
  g.neovide_confirm_quit = true

  g.neovide_cursor_unfocused_outline_width = 0.05
  g.neovide_cursor_vfx_particle_lifetime = 0.1

  g.neovide_touch_drag_timeout = 0.1

  g.neovide_cursor_animation_length = 0.05
  g.neovide_cursor_trail_size = 0.1

  local function set_ime(args)
    if args.event:match "Enter$" then
      g.neovide_input_ime = true
    else
      g.neovide_input_ime = false
    end
  end

  local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

  autocmd({ "InsertEnter", "InsertLeave" }, {
    group = ime_input,
    pattern = "*",
    callback = set_ime,
  })

  autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
    group = ime_input,
    pattern = "[/\\?]",
    callback = set_ime,
  })
end

if vim.loop.os_uname().sysname == "Darwin" then
  g.clipboard = {
    name = "macOS-clipboard",
    copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
    paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
    cache_enabled = 0,
  }
  opt.clipboard = ""
end

local python3 = vim.env.HOME .. "/.asdf/shims/python3"
if vim.fn.executable(python3) then
  g.python3_host_prog = python3
elseif vim.fn.executable "/usr/local/bin/python3" then
  g.python3_host_prog = "/usr/local/bin/python3"
elseif vim.fn.executable "/opt/local/bin/python3" then
  g.python3_host_prog = "/opt/local/bin/python3"
elseif vim.fn.executable "/usr/bin/python3" then
  g.python3_host_prog = "/usr/bin/python3"
else
  g.python3_host_prog = "/opt/homebrew/bin/python3"
end

g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_python_provider = 1

autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

-------------------------------------- commands ------------------------------------------
-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
