return {
    "nvim-lua/plenary.nvim",
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require('plugins.configs.catppuccin')
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require('plugins.configs.autopairs')
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        -- opts = { show_trailing_blankline_indent = false }
    },
    { 'numToStr/Comment.nvim', opts = {} },
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            -- { 'j-hui/fidget.nvim', opts = { tag = 'legacy'} },
            'folke/neodev.nvim',
        },
        config = function()
            require('plugins.configs.lsp')
        end,
    },
    -- {
    --     'nvim-lualine/lualine.nvim',
    --     opts = {
    --         options = {
    --             theme = 'catppuccin',
    --             icons_enabled = true,
    --             component_separators = ' ',
    --             section_separators = ' ',
    --             disabled_filetypes = {'neo-tree', 'TelescopePrompt'},
    --             refresh = {
    --                 statusline = 1000,
    --             }
    --         },
    --         sections = {
    --             lualine_a = {'mode'},
    --             lualine_b = {
    --                 {
    --                     'buffers',
    --                     show_filename_only = false,
    --                     mode = 2,
    --                     use_mode_colors = true,
    --                 },
    --             },
    --             lualine_c = {},
    --             lualine_x = {},
    --             lualine_y = {'progress'},
    --             lualine_z = {'location'}
    --         },
    --         tabline = {},
    --     },
    -- },
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
        "nvim-neo-tree/neo-tree.nvim",
        version = "*",
        lazy = true,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require('plugins.configs.neo-tree')
        end,
    },
    -- detect shiftwidth and tabstop automatically
    'tpope/vim-sleuth',
    'tpope/vim-surround',

    -- require('plugins.configs.debug'),
}
