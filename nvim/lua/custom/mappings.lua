local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}


M.telescope = {
  plugin = true,

  n = {
    -- find
    -- ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>gf"] = { "<cmd> Telescope git_files <CR>", "Find Git files" },
  },
}

return M
