local mason_registry = require('mason-registry')
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'omnisharp', 'lua_ls' },
})

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'go',
        'gomod',
        'python',
        'javascript',
        'lua',
        'rust',
        'c',
        'cpp',
        'typescript',
        'erlang',
        'java',
        'ruby',
        'zig',
        'haskell',
        'fortran',
        'bash',
        'cmake',
        'make',
        'bicep',
    },
    highlight = {
        enable = true,
    },
})

vim.lsp.config('gopls', {
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})

vim.lsp.config.ruff = {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    init_options = {
        settings = {
            -- Prefer filesystem config (pyproject.toml / ruff.toml)
            configurationPreference = 'filesystemFirst',
        },
    },
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        timeout_ms = 2000,
                        filter = function(c)
                            return c.name == 'ruff'
                        end,
                    })
                end,
            })
        end
    end,
}

vim.lsp.enable('ruff')

require('conform').setup({
    formatters_by_ft = {
        lua = { 'stylua' },
    },
    format_on_save = {
        lsp_fallback = true, -- Fallback to LSP formatting if no specific formatter is found
        async = false,
        timeout_ms = 1000,
    },
})

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.c', '*.cpp', '*.h', '*.hpp' },
    callback = function()
        vim.cmd('silent! !clang-format -i %')
    end,
})
