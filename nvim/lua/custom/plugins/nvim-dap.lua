--
--
--nvim-dap is a Debug Adapter Protocol client implementation for Neovim. nvim-dap allows you to:

local nvimDap = {
  "mfussenegger/nvim-dap",
  init = function()
    require("core.utils").load_mappings "dap"
  end,
}

return nvimDap
