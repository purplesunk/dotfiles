return {

    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require('plugins.configs.catppuccin')
        end,
    },

    'nvim-lua/plenary.nvim',
    'tpope/vim-sleuth',
    'tpope/vim-surround',

    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            {
                'williamboman/mason.nvim',
                cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
                event = { "VeryLazy" },
                config = true
            },
            'williamboman/mason-lspconfig.nvim',
            'folke/neodev.nvim',
        },
        config = function()
            require('plugins.configs.lsp')
        end,
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            -- Adds LSP completion capabilities
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
        config = function()
            require('plugins.configs.cmp')
        end,
    },

    {
        -- Fuzzy Finder (files, lsp, etc)
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        config = function()
            require('plugins.configs.telescope')
        end,
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
        config = function()
            require('plugins.configs.treesitter')
        end,
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require('plugins.configs.autopairs')
        end,
    },

    { 'numToStr/Comment.nvim', opts = {} },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },

    -- require('plugins.configs.debug'),
}
