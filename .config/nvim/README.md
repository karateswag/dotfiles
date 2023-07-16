# neovim configuration:

## Plugins I use

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim)                                     *package manager*
- [maxmx03/fluoromachine.nvim](https://github.com/maxmx03/FluoroMachine.nvim)               *theming*
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)     *highlighting*
- [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)             *color highlighter*
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)                     *file explorer*
- [tnvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)            *devicons*
- [nvim-lualine/lualine.nvim status](https://github.com/nvim-lualine/lualine.nvim)          *status line*
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                     *git decorations*
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)                               *git wrapper*
- [numToStr/Comment.nvim](numToStr/Comment.nvim)                                            *line commenting*
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)                         *brackets auto pairing*
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)         *fuzzy finder*
- [VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)                 *lsp completion bundle*
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                         *configs for nvim lsp client*
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)                     *Package manager for lsp*
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) *lspconfig/mason brige*
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                   *completion engine*
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)                                   *nvim-cmp source for filesystem paths*
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)                               *nvim-cmp source for buffer words*
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)                           *nvim-cmp source for neovim LSP client*
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)                                   *snippets engine*
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)                   *luasnip completion source for nvim-cmp*
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)           *Snippets collection*

## Dependencies:

The following dependencies are required to run this config:

- neovim >= 0.9.0
- git >= 2.19.0
- curl
- wget
- unzip
- tar
- fd
- ripgrep
- npm
- cargo
- gcc
- [a Nerd Font](https://www.nerdfonts.com/) 

### on archlinux

just run:
```shell
sudo pacman -S neovim git curl wget unzip tar fd ripgrep npm cargo gcc --needed--noconfirm
```

### On ubuntu:

Install required packages:

```shell
sudo apt-get update
sudo apt-get install -y git curl wget unzip tar fd-find ripgrep npm cargo gcc
```

install neovim via PPA/unstable

```shell
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim
```

or install neovim via snap:

```shell
sudo snap install nvim
```
