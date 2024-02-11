--
--
-- This is a Vim plugin that provides Rust file detection, syntax highlighting, formatting, Syntastic integration, and more. It requires Vim 8 or higher for full functionality. Some things may not work on earlier versions.

local rustVim = {
  "rust-lang/rust.vim",
  ft = "rust",
  init = function()
    vim.g.rustfmt_autosave = 1
  end,
}

return rustVim
