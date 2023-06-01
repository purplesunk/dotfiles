-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local ok, lazy = pcall(require, "lazy")
if not ok then
	return
end

-- We have to set the leader key here for lazy.nvim to work
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load plugins from specifications
-- (The leader key must be set before this)
lazy.setup({
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000
    },
    {
        "windwp/nvim-autopairs",
        dependencies = { 'hrsh7th/nvim-cmp' },
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
        opts = { show_trailing_blankline_indent = false }
    },
    { 'numToStr/Comment.nvim', opts = {} },
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim', opts = {} },
            'folke/neodev.nvim',
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = false,
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_b = { 'buffers' }
            }
        }
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
        }
    },
    {
        -- Fuzzy Finder (files, lsp, etc)
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },

        }
    },
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate'
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        }
    },
    -- detect shiftwidth and tabstop automatically
    'tpope/vim-sleuth',

    require('fmb.plugin_configs.debug'),
    require('fmb.plugin_configs.autoformat')
})
