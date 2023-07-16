-- Author: karateSwag
-- Repo: https://github.com/karateswag/dotfiles

-- set leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- leader pv to nvim Ex
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- navigation between pane with Ctrl + {k,j,h,l}
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
