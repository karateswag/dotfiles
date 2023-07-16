-- Author: karateSwag
-- Repo: https://github.com/karateswag/dotfiles

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  view = {
    adaptive_size = true
  }
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
