vim.g.mapleader = ','

vim.api.nvim_set_keymap(
    'i',
    '<C-s>',
    [[<cmd>lua require('luasnip').expand_or_jump()<CR>]],
    { silent = true, noremap = true }
)

vim.api.nvim_set_keymap(
    's',
    '<C-k>',
    [[<cmd>lua require('luasnip').expand_or_jump()<CR>]],
    { silent = true, noremap = true }
)

vim.api.nvim_set_keymap('i', '<C-h>', [[<cmd>lua require('luasnip').jump(-1)<CR>]], { silent = true, noremap = true })
vim.api.nvim_set_keymap('s', '<C-h>', [[<cmd>lua require('luasnip').jump(-1)<CR>]], { silent = true, noremap = true })

-- Enter Telescope in Live Grep Mode
vim.keymap.set('n', '<tab>', function()
    require('telescope.builtin').live_grep({ cwd = vim.loop.cwd() })
end, { noremap = true, silent = true })

-- Global Enter Telescope and nvim-tree
vim.keymap.set('n', '<C-[>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-m>', ':Telescope<CR>')

-- Highlight Toggle
vim.keymap.set('n', '<C-l>', function()
    if vim.opt.hlsearch:get() == true then
        vim.opt.hlsearch = false
    else
        local last_search = vim.fn.getreg('/')
        if last_search ~= '' then
            vim.opt.hlsearch = true
            vim.cmd("silent! execute '/' .. vim.fn.escape('" .. last_search .. "', '/')")
        end
    end
end)

-- Key to automatically vertical split
vim.keymap.set('n', '<leader>v', function()
    vim.cmd('vsplit')
    vim.cmd('wincmd =')
end)

-- Telescope keybindings
require('Telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<leader>v'] = require('telescope.actions').select_vertical,
                ['<leader>h'] = require('telescope.actions').select_horizontal,
                ['<leader>t'] = require('telescope.actions').select_tab,
            },
            n = {
                ['<leader>v'] = require('telescope.actions').select_vertical,
                ['<leader>h'] = require('telescope.actions').select_horizontal,
                ['<leader>t'] = require('telescope.actions').select_tab,
            },
        },
    },
})

-- nvim-tree keybindings
local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', 's', function()
        api.node.open.vertical()
        api.tree.close()
    end, opts('Open: Vertical Split'))
    vim.keymap.set('n', 'v', function()
        api.node.open.horizontal()
        api.tree.close()
    end, opts('Open: Horizontal Split'))
    vim.keymap.set('n', 't', function()
        api.node.open.tab()
        api.tree.close()
    end, opts('Open: New Tab'))
end

require('nvim-tree').setup({
    on_attach = on_attach,
})

--Keybind Search and Replace
vim.keymap.set('n', '<leader>r', function()
    local search = vim.fn.input('Search Word: ')
    if search == '' then
        return
    end
    local repl = vim.fn.input('Replacement Word: ')
    vim.cmd(string.format('%%s/%s/%s/g', search, repl))
end)

--Multiple Cursors
vim.keymap.set({ 'n', 'i' }, '<C-j>', '<Cmd>MultipleCursorsAddDown<CR>')
vim.keymap.set({ 'n', 'i' }, '<C-k>', '<Cmd>MultipleCursorsAddUp<CR>')
vim.keymap.set({ 'n', 'i' }, '<leader>v', '<Cmd>MultipleCursorsAddVisualArea<CR>')
vim.keymap.set({ 'n', 'i' }, '<leader>m', '<Cmd>MultipleCursorsAddMatches<CR>')
vim.keymap.set({ 'n', 'i' }, '<leader>l', '<Cmd>MultipleCursorsAddJumpNextMatch<CR>')
vim.keymap.set({ 'n', 'i' }, '<leader>h', '<Cmd>MultipleCursorsAddHJumpPrevMatch<CR>')
