local plugins = {
  {
    "vim-crystal/vim-crystal",
    ft = 'crystal'
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require 'plugins.configs.lspconfig'
      require 'custom.lspconfig'
    end
  },
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.null-ls"
      end,
    },
    config = function()
        require "plugins.configs.lspconfig"
        require "custom.lspconfig"
    end,
  }
}

return plugins
