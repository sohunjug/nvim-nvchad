local M = { "rcarriga/nvim-dap-ui", dependencies = {
  "mfussenegger/nvim-dap",
  "nvim-neotest/nvim-nio",
} }

M.config = function()
  local dap = require "dap"
  dap.adapters.java = function(callback)
    -- FIXME:
    -- Here a function needs to trigger the `vscode.java.startDebugSession` LSP command
    -- The response to the command must be the `port` used below
    callback {
      type = "server",
      host = "127.0.0.1",
      port = 5005,
    }
  end

  dap.configurations.java = {
    {
      type = "java",
      request = "attach",
      name = "Debug (Attach) - Remote",
      hostName = "127.0.0.1",
      port = 5005,
    },
  }
  require("dapui").setup()
end

return M
