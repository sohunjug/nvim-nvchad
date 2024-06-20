local M = {
  "nvim-tree/nvim-tree.lua",
}

M.init = function()
  require("utils").load_mappings "nvimtree"
end

M.config = function()
  -- local tree_cb = require("nvim-tree.config").nvim_tree_callback
  local function on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Default mappings. Feel free to modify or remove as you wish.
    --
    -- BEGIN_DEFAULT_ON_ATTACH
    vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts "CD")
    vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts "Open: In Place")
    vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts "Info")
    vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts "Rename: Omit Filename")
    vim.keymap.set("n", "<C-t>", api.node.open.tab, opts "Open: New Tab")
    vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts "Open: Vertical Split")
    vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts "Open: Horizontal Split")
    vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts "Close Directory")
    vim.keymap.set("n", "<CR>", api.node.open.edit, opts "Open")
    vim.keymap.set("n", "<Tab>", api.node.open.preview, opts "Open Preview")
    vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts "Next Sibling")
    vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts "Previous Sibling")
    vim.keymap.set("n", ".", api.node.run.cmd, opts "Run Command")
    vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts "Up")
    vim.keymap.set("n", "a", api.fs.create, opts "Create")
    vim.keymap.set("n", "N", api.fs.create, opts "Create")
    vim.keymap.set("n", "bmv", api.marks.bulk.move, opts "Move Bookmarked")
    vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts "Toggle No Buffer")
    vim.keymap.set("n", "c", api.fs.copy.node, opts "Copy")
    vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts "Toggle Git Clean")
    vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts "Prev Git")
    vim.keymap.set("n", "]c", api.node.navigate.git.next, opts "Next Git")
    vim.keymap.set("n", "d", api.fs.remove, opts "Delete")
    vim.keymap.set("n", "D", api.fs.trash, opts "Trash")
    vim.keymap.set("n", "E", api.tree.expand_all, opts "Expand All")
    vim.keymap.set("n", "e", api.fs.rename_basename, opts "Rename: Basename")
    vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts "Next Diagnostic")
    vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts "Prev Diagnostic")
    vim.keymap.set("n", "F", api.live_filter.clear, opts "Clean Filter")
    vim.keymap.set("n", "f", api.live_filter.start, opts "Filter")
    vim.keymap.set("n", "g?", api.tree.toggle_help, opts "Help")
    vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts "Copy Absolute Path")
    vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts "Toggle Dotfiles")
    vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts "Toggle Git Ignore")
    vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts "Last Sibling")
    vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts "First Sibling")
    vim.keymap.set("n", "m", api.marks.toggle, opts "Toggle Bookmark")
    vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
    vim.keymap.set("n", "o", api.node.open.edit, opts "Open")
    vim.keymap.set("n", "O", api.node.open.no_window_picker, opts "Open: No Window Picker")
    vim.keymap.set("n", "p", api.fs.paste, opts "Paste")
    vim.keymap.set("n", "P", api.node.navigate.parent, opts "Parent Directory")
    vim.keymap.set("n", "<S-CR>", api.node.navigate.parent, opts "Parent Directory")
    vim.keymap.set("n", "h", api.node.navigate.parent, opts "Parent Directory")
    vim.keymap.set("n", "q", api.tree.close, opts "Close")
    vim.keymap.set("n", "r", api.fs.rename, opts "Rename")
    vim.keymap.set("n", "R", api.tree.reload, opts "Refresh")
    vim.keymap.set("n", "s", api.node.run.system, opts "Run System")
    vim.keymap.set("n", "S", api.tree.search_node, opts "Search")
    vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts "Toggle Hidden")
    vim.keymap.set("n", "W", api.tree.collapse_all, opts "Collapse")
    vim.keymap.set("n", "x", api.fs.cut, opts "Cut")
    vim.keymap.set("n", "y", api.fs.copy.filename, opts "Copy Name")
    vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts "Copy Relative Path")
    vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts "Open")
    vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts "CD")
    -- END_DEFAULT_ON_ATTACH

    -- Mappings migrated from view.mappings.list
    --
    -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  end

  require("nvim-tree").setup {
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    -- ignore_ft_on_setup = { "dashboard" }, -- don't open tree on specific fiypes.
    -- ignore_buffer_on_setup = false,
    -- open_on_setup = false,
    -- open_on_setup_file = false,
    -- open_on_tab = false,
    sort_by = "case_sensitive",
    prefer_startup_root = true,
    sync_root_with_cwd = true,
    reload_on_bufenter = false,
    respect_buf_cwd = false,
    on_attach = on_attach,
    renderer = {
      add_trailing = true,
      group_empty = true,
      highlight_git = true,
      full_name = false,
      highlight_opened_files = "all",
      root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" },
      --":~",
      indent_markers = {
        enable = true,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          bottom = "─",
          none = " ",
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = "before",
        modified_placement = "after",
        padding = " ",
        symlink_arrow = " ➛ ",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
          modified = true,
        },
        glyphs = {
          default = "",
          symlink = "",
          bookmark = "",
          modified = "●",
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
      special_files = {
        "Cargo.toml",
        "cargo.toml",
        "Makefile",
        "README.md",
        "readme.md",
        "makefile",
        "Makefile",
        "MAKEFILE",
        "go.mod",
      },
      symlink_destination = true,
    },
    root_dirs = {
      ".git",
    },
    --[[ update_to_buf_dir = {
         -- enable the feature
         enable = true,
         -- allow to open the tree if it was previously closed
         auto_open = true,
      }, ]]
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = true,
      debounce_delay = 50,
      severity = {
        min = vim.diagnostic.severity.HINT,
        max = vim.diagnostic.severity.ERROR,
      },
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    update_focused_file = {
      -- enables the feature
      enable = true,
      -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
      -- only relevant when `update_focused_file.enable` is true
      update_root = {
        enable = true,
        ignore_list = { ".git", "node_modules", ".cache" },
      },
      -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
      -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    },
    view = {
      side = "left",
      centralize_selection = false,
      cursorline = true,
      debounce_delay = 15,
      width = 30,
      -- hide_root_folder = false,
      -- adaptive_size = false,
      number = false,
      relativenumber = false,
      preserve_window_proportions = false,
      signcolumn = "yes",
      float = {
        enable = false,
        quit_on_focus_loss = true,
        open_win_config = {
          relative = "editor",
          border = "rounded",
          width = 30,
          height = 30,
          row = 1,
          col = 1,
        },
      },
      --[[ mappings = {
				list = {
					{ key = { "l", "o", "<2-LeftMouse>", "<CR>" }, action_cb = tree_cb "edit" },
					{ key = { "i", "<2-RightMouse>" },             action_cb = tree_cb "cd" },
					{ key = "<C-v>",                               action_cb = tree_cb "vsplit" },
					{ key = "<C-x>",                               action_cb = tree_cb "split" },
					{ key = "<C-t>",                               action_cb = tree_cb "tabnew" },
					{ key = "<",                                   action_cb = tree_cb "prev_sibling" },
					{ key = ">",                                   action_cb = tree_cb "next_sibling" },
					{ key = "P",                                   action_cb = tree_cb "parent_node" },
					{ key = { "h", "<S-CR>" },                     action_cb = tree_cb "close_node" },
					{ key = "<Tab>",                               action_cb = tree_cb "preview" },
					{ key = "K",                                   action_cb = tree_cb "first_sibling" },
					{ key = "J",                                   action_cb = tree_cb "last_sibling" },
					{ key = "I",                                   action_cb = tree_cb "toggle_ignored" },
					{ key = { "H", "." },                          action_cb = tree_cb "toggle_dotfiles" },
					{ key = "r",                                   action_cb = tree_cb "refresh" },
					{ key = { "a", "N" },                          action_cb = tree_cb "create" },
					{ key = { "D", "dd" },                         action_cb = tree_cb "remove" },
					{ key = "R",                                   action_cb = tree_cb "rename" },
					{ key = "<C->",                                action_cb = tree_cb "full_rename" },
					{ key = "x",                                   action_cb = tree_cb "cut" },
					{ key = "c",                                   action_cb = tree_cb "copy" },
					{ key = "p",                                   action_cb = tree_cb "paste" },
					{ key = "y",                                   action_cb = tree_cb "copy_name" },
					{ key = "Y",                                   action_cb = tree_cb "copy_path" },
					{ key = "gy",                                  action_cb = tree_cb "copy_absolute_path" },
					{ key = "[c",                                  action_cb = tree_cb "prev_git_item" },
					{ key = "}c",                                  action_cb = tree_cb "next_git_item" },
					{ key = { "-", "BS", "u" },                    action_cb = tree_cb "dir_up" },
					{ key = "O",                                   action_cb = tree_cb "system_open" },
					{ key = "q",                                   action_cb = tree_cb "close" },
					{ key = "g?",                                  action_cb = tree_cb "toggle_help" },
				},
			}, ]]
    },
    system_open = {
      cmd = "",
      args = {},
    },
    filters = {
      dotfiles = false,
      custom = {},
      exclude = {
        vim.fn.stdpath "config" .. "/lua/custom",
        vim.env.HOME .. "/Code/dotfiles/.config/nvim/lua/custom",
      },
    },
    filesystem_watchers = {
      enable = false,
      debounce_delay = 50,
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    git = {
      enable = true,
      ignore = true,
      show_on_dirs = true,
      show_on_open_dirs = true,
      timeout = 400,
    },
    modified = {
      enable = false,
      show_on_dirs = true,
      show_on_open_dirs = true,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
      },
      expand_all = {
        max_folder_discovery = 300,
        exclude = {},
      },
      file_popup = {
        open_win_config = {
          col = 1,
          row = 1,
          relative = "cursor",
          border = "shadow",
          style = "minimal",
        },
      },
      open_file = {
        quit_on_open = false,
        resize_window = true,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", "Outline", "Trouble" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
      remove_file = {
        close_window = true,
      },
    },
    live_filter = {
      prefix = "[FILTER]: ",
      always_show_folders = true,
    },
    tab = {
      sync = {
        open = true,
        close = true,
        ignore = {},
      },
    },
    notify = {
      threshold = vim.log.levels.INFO,
    },
    ui = {
      confirm = {
        remove = true,
        trash = true,
      },
    },
    experimental = {
      git = {
        async = true,
      },
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        dev = false,
        diagnostics = false,
        git = false,
        profile = false,
        watcher = false,
      },
    },
  }
end

--M.setup = function()
--vim.cmd [[highlight NvimTreeFolderIcon guibg=blue]]
--end
return M
