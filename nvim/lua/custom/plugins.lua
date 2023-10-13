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
      -- "jose-elias-alvarez/null-ls.nvim",
      -- config = function()
        -- require "custom.null-ls"
      -- end,
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
  {
      "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,

  },
  {
      "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,

  }
}

return plugins
