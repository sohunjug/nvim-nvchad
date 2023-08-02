local M = {
  "gelguy/wilder.nvim",
  lazy = false,
}

M.config = function()
  local wilder = require "wilder"
  wilder.setup { modes = { ":", "/", "?" } }
  -- wilder.set_option('renderer', wilder.popupmenu_renderer(
  -- wilder.popupmenu_border_theme({
  --   highlights = {
  --     border = 'Normal', -- highlight to use for the border
  --   },
  --   -- 'single', 'double', 'rounded' or 'solid'
  --   -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
  --   border = 'rounded',
  -- })))
  local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_palette_theme {
    -- 'single', 'double', 'rounded' or 'solid'
    -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
    -- highlighter = {
    --   wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
    --   wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found
    --   -- at https://github.com/romgrk/fzy-lua-native
    -- },
    highlighter = wilder.basic_highlighter(),
    highlights = {
      accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
    },
    border = "double",
    empty_message = wilder.popupmenu_empty_message_with_spinner(),
    max_height = "35%", -- max height of the palette
    min_height = 0, -- set to the same as 'max_height' for a fixed height window
    prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
    reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
    separator = " · ",
    left = {
      " ",
      wilder.popupmenu_devicons(),
      wilder.popupmenu_buffer_flags {
        flags = " a + ",
        icons = { ["+"] = "", a = "", h = "" },
      },
    },
    right = {
      " ",
      wilder.popupmenu_scrollbar(),
    },
  })

  local wildmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
    highlights = {
      border = "Normal", -- highlight to use for the border
    },
    -- 'single', 'double', 'rounded' or 'solid'
    -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
    border = "rounded",
    highlighter = wilder.basic_highlighter(),
  })
  wilder.set_option(
    "renderer",
    wilder.renderer_mux {
      [":"] = popupmenu_renderer,
      ["/"] = wildmenu_renderer,
      ["?"] = wildmenu_renderer,
    }
  )
end

return M
