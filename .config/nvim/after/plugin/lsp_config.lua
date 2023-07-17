-- Author: karateSwag
-- Repo: https://github.com/karateswag/dotfiles

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
  'ansiblels',
  'bashls',
  'cssls',
  'docker_compose_language_service',
  'dockerls',
  'emmet_language_server',
  'eslint',
  'html',
  'jsonls',
  'lua_ls',
  'marksman',
  'pyright',
  'terraformls',
  'tsserver',
  'yamlls',
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
