local M = {
  "OscarCreator/rsync.nvim",
}

M.event = "VeryLazy"

M.build = "make build"

M.config = function()
  require("rsync").setup {
    fugitive_sync = false,
    sync_on_save = true,
    project_config_path = ".rsync.nvim.toml",
  }
end

return M
