--
--
-- A neovim plugin that helps managing rust crates.io dependencies.

local crate = {
  "saecki/crates.nvim",
  ft = { "toml" },
  config = function(_, opts)
    local crates = require "crates"
    crates.setup(opts)
    require("cmp").setup.buffer {
      sources = { { name = "crates" } },
    }
    crates.show()
    require("core.utils").load_mappings "crates"
  end,
}

return crate
