local M = {
  enabled = false,
  "huggingface/llm.nvim",
  event = "VeryLazy",
}

M.config = function()
  local llm = require "llm"

  llm.setup {
    api_token = "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", -- cf Install paragraph
    model = "http://172.23.6.66:8080/", -- can be a model ID or an http(s) endpoint
    -- parameters that are added to the request body
    query_params = {
      max_new_tokens = 128,
      temperature = 0.2,
      top_p = 0.95,
      stop_token = "<|endoftext|>",
    },
    -- set this if the model supports fill in the middle
    fim = {
      enabled = true,
      prefix = "<fim_prefix>",
      middle = "<fim_middle>",
      suffix = "<fim_suffix>",
    },
    lsp = {
      bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
    },
    debounce_ms = 80,
    accept_keymap = "<C-p>",
    dismiss_keymap = "<C-i>",
    max_context_after = 5000,
    max_context_before = 5000,
    tls_skip_verify_insecure = true,
    tokenizer = nil, -- cf Tokenizer paragraph
    context_window = 8192, -- max number of tokens for the context window
    enable_suggestions_on_startup = true,
    enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
  }
end

return M
