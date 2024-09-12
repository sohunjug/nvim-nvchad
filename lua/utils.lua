local M = {}
local unpack = table.unpack or unpack ---@diagnostic disable-line: deprecated
local merge_tb = vim.tbl_deep_extend

-- 定义遍历目录的函数
M.require_dir = function(path, subpath)
  local modules = {}
  for _, file in ipairs(vim.fn.readdir(path, [[v:val =~ '\.lua$']])) do
    local name = file:gsub("%.lua$", "")
    modules[name] = require(subpath .. "." .. name)
  end
  return modules
end

M.tb_merge = function(src, dst)
  return vim.tbl_deep_extend("force", src, dst)
end


M.partial = function(fn, ...)
  local n, args = select('#', ...), { ... }
  return function(...)
    local sn, sargs = select('#', ...), { ... }
    return fn(unpack(args, 1, n), unpack(sargs, 1, sn))
  end
end

M.closeOtherBufs = function()
  for _, buf in ipairs(vim.t.bufs) do
    if buf ~= vim.api.nvim_get_current_buf() then
      vim.api.nvim_buf_delete(buf, {})
    end
  end

  vim.cmd "redrawtabline"
end

M.load_mappings = function(section, mapping_opt)
  vim.schedule(function()
    local function set_section_map(section_values)
      if section_values.plugin then
        return
      end

      section_values.plugin = nil

      for mode, mode_values in pairs(section_values) do
        local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
        for keybind, mapping_info in pairs(mode_values) do
          -- merge default + user opts
          local opts = merge_tb("force", default_opts, mapping_info.opts or {})

          mapping_info.opts, opts.mode = nil, nil
          opts.desc = mapping_info[2]

          vim.keymap.set(mode, keybind, mapping_info[1], opts)
        end
      end
    end

    local mappings = require"mappings"

    if type(section) == "string" then
      mappings = { mappings[section] }
    end

    for _, sect in pairs(mappings) do
      set_section_map(sect)
    end
  end)
end

return M
