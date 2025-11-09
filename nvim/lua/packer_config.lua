require('packer').startup(function()
    use('wbthomason/packer.nvim')
    use({
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = 'storm'
            vim.g.tokyonight_transparent = false
            vim.cmd('colorscheme tokyonight')
        end,
    })

    use({
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
    })

    use({
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({})
        end,
    })

    use('nvim-treesitter/nvim-treesitter')

    use({
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
        },
    })

    use('neovim/nvim-lspconfig')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')

    use({
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup()
        end,
    })

    use({
        'tpope/vim-fugitive',
    })

    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup()
        end,
    })

    use({
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('nvim-tree').setup({
                actions = {
                    open_file = {
                        resize_window = true,
                        window_picker = {
                            enable = false,
                        },
                    },
                },
            })
        end,
    })

    use({
        'L3MON4D3/LuaSnip',
        requires = { 'rafamadriz/friendly-snippets' },
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
        end,
    })

    use('lukas-reineke/indent-blankline.nvim')
    use({
        'brenton-leighton/multiple-cursors.nvim',
        version = '*',
        config = function()
            require('multiple-cursors').setup()
        end,
    })

    use('stevearc/conform.nvim')
end)
