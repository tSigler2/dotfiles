local ls = require('luasnip')
require('luasnip.config').setup({
    enable_autosnippets = true,
    store_selection_in_reg = true,
})

local cmp = require('cmp')
cmp.setup({
    -- Completion settings
    completion = {
        autocomplete = { cmp.TriggerEvent.InsertEnter, cmp.TriggerEvent.TextChanged },
    },
    -- Key mappings for nvim-cmp
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    -- Configure the sources for completion
    sources = {
        { name = 'nvim_lsp' }, -- LSP source
        { name = 'buffer' }, -- Buffer source
        { name = 'path' }, -- Path source
        { name = 'luasnip' }, -- Snippets source
    },
    -- Enable Snippet expansion with LuaSnip
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
})
