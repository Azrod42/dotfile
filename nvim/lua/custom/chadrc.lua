---@type ChadrcConfig
local M = {}

-- M.ui = { theme = 'palenight' }

M.ui = {
    theme_toggle = "palenight",
    theme = "palenight",
    transparency = true
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
