--
--
-- A plugin to improve your rust experience in neovim.

local rustaceanvim = {
  "mrcjkb/rustaceanvim",
  version = "^4", -- Recommended
  ft = { "rust" },
  vim.keymap.set("n", "<leader>a", ":RustLsp hover actions<CR>"),
}

return rustaceanvim
