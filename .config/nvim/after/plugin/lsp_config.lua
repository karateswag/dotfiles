-- Author: karateSwag
-- Repo: https://github.com/karateswag/dotfiles

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'html',
  'emmet_language_server',
  'lua_ls',
  'dockerls',
  'docker_compose_language_service',
  'terraformls',
  'ansiblels',
  'bashls',
})

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
    {name = 'nvim_lsp'},
  },
  mapping = {
    -- `Enter` key to confirm completion
    --['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<CR>'] = cmp.mapping.confirm({select = true}),

    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- 'Tab' to navigate between suggestion
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }
})
