-- Author: karateSwag
-- Repo: https://github.com/karateswag/dotfiles

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
  },

  sync_install = false,

  auto_install = true,

  autopairs = {
    enable = true,
  },

  highlight = {
    enable = true,
  },
}
