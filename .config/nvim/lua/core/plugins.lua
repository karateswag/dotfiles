-- Author: karateSwag
-- Repo: https://github.com/karateswag/dotfiles

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",                        -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

-- Theming & highlights
  'maxmx03/fluoromachine.nvim',               -- theming
  'nvim-treesitter/nvim-treesitter',          -- treesitter highlighting
  'norcalli/nvim-colorizer.lua',              -- color highlighter

-- file explorer
  'nvim-tree/nvim-tree.lua',                  -- tree file explorer
  'nvim-tree/nvim-web-devicons',              -- devicons for nvim-tree

-- Status line
  'nvim-lualine/lualine.nvim',                -- lua status line

-- plugins for git
  'lewis6991/gitsigns.nvim',                  -- gitsigns git decorations
  'tpope/vim-fugitive',                       -- vim-fugitive git wrapper

-- editing
  'numToStr/Comment.nvim',                    -- to comment
  'windwp/nvim-autopairs',                    -- for brackets

-- Fuzzy Finder
  {
    'nvim-telescope/telescope.nvim',          -- highly extendable fuzzy finder
    branch = '0.1.x',
    dependencies = {'nvim-lua/plenary.nvim'}  -- Library of lua function for nvim / telescope dep
  },

-- Language Server / Completion
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},              -- configs for nvim lsp client
      {
        'williamboman/mason.nvim',            -- Package manager for lsp
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'},  -- lspconfig/mason brige

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},                   -- completion engine
      {'hrsh7th/cmp-path'},                   -- nvim-cmp source for filesystem paths
      {'hrsh7th/cmp-buffer'},                 -- nvim-cmp source for buffer words.
      {'hrsh7th/cmp-nvim-lsp'},               -- nvim-cmp source for neovim LSP client
      {'L3MON4D3/LuaSnip'},                   -- snippets engine
      {'saadparwaiz1/cmp_luasnip'},           -- luasnip completion source for nvim-cmp
      {"rafamadriz/friendly-snippets"},       -- Snippets collection
    }
  },
})
