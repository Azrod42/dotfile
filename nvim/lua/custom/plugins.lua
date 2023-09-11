local cmp = require "cmp"

local plugins = {
    {
      "vim-crystal/vim-crystal",
      ft = 'crystal'
    },
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "rust-analyzer",
  --     },
  --   },
  -- },
  {
    "neovim/nvim-lspconfig",

    -- dependencies = {
    --   "jose-elias-alvarez/null-ls.nvim",
    --   config = function()
    --     require "custom.null-ls"
    --   end,
    -- },
    config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },
 {
   'saecki/crates.nvim',
   ft = {"toml"},
   config = function(_, opts)
     local crates  = require('crates')
     crates.setup(opts)
     require('cmp').setup.buffer({
       sources = { { name = "crates" }}
     })
     crates.show()
     require("core.utils").load_mappings("crates")
   end,
 },
 {
   "hrsh7th/nvim-cmp",
   opts = function()
   local M = require "plugins.configs.cmp"
   M.completion.completeopt = "menu,menuone,noselect"
   M.mapping["<CR>"] = cmp.mapping.confirm {
       behavior = cmp.ConfirmBehavior.Insert,
      select = false,
     }
     table.insert(M.sources, {name = "crates"})
     return M
   end,
 },
 {
   "rust-lang/rust.vim",
   ft = "rust",
   init = function ()
     vim.g.rustfmt_autosave = 1
   end
 },
 {
   "mfussenegger/nvim-dap",
   init = function()
     require("core.utils").load_mappings("dap")
   end
 },
   {
   "theHamsta/nvim-dap-virtual-text",
   lazy = false,
  config = function(_, opts)
     require("nvim-dap-virtual-text").setup()
   end
 },
}

return plugins
