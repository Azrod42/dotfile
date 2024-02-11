---@type ChadrcConfig
local M = {}

M.ui = {
  theme_toggle = "github_dark",
  theme = "github_dark",
  transparency = true,
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
