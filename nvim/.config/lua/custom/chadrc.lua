-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "onedark",
  -- transparency = true,
}

-- require "custom"

M.plugins = require "custom.plugins"
-- vim.pretty_print(M.plugins)


M.mappings = require "custom.mappings"

return M
