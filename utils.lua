local M = {}
local unpack = table.unpack or unpack

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

return M
