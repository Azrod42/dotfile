--
--
--This plugin adds virtual text support to nvim-dap. nvim-treesitter is used to find variable definitions.

local nvimDapVirText = {
  "theHamsta/nvim-dap-virtual-text",
  lazy = false,
  config = function(_, opts)
    require("nvim-dap-virtual-text").setup()
  end,
}

return nvimDapVirText
