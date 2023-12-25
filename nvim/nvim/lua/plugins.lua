-- install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy.nvim and add all plugins
require('lazy').setup({
    -- color schemes
    {
        'rose-pine/neovim',
        lazy = false,
        priority = 1000,
    },
    {
        'catppuccin/vim', name = 'catppuccin',
        lazy = false,
        priority = 1000,
    },
    {
        'daltonmenezes/aura-theme',
        lazy = false,
        priority = 1000,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. '/packages/neovim')
        end,
    },
    {
        'loctvl842/monokai-pro.nvim',
        lazy = false,
        priority = 1000,
    },
    {
        'sainnhe/sonokai',
        lazy = false,
        priority = 1000,
    },
    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
    },
    {
        'kaicataldo/material.vim',
        lazy = false,
        priority = 1000,
    },

    {
        'lervag/vimtex',
        lazy = false,
        config = function()
            vim.g.vimtex_syntax_conceal = {
                accents = 1,
                ligatures = 1,
                cites = 1,
                fancy = 1,
                spacing = 0,
                greek = 1,
                math_bounds = 0,
                math_delimiters = 1,
                math_fracs = 1,
                math_super_sub = 1,
                math_symbols = 1,
                sections = 1,
                styles = 1,
            }
        end,
    },

    -- Mastering the vim language plugins
    'tpope/vim-repeat',
    {
        "kylechui/nvim-surround",
        version = "*", -- use for stability
        event = "VeryLazy",
        opts = {},
    },
    -- causes delay on 'c' commands
    -- specifically in visual mode, 'c' will be delayed
    -- as the command might be 'cp'
    -- 'christoomey/vim-system-copy',
    'vim-scripts/ReplaceWithRegister',
    'mg979/vim-visual-multi',

    'nvim-lua/plenary.nvim',

    'nvim-telescope/telescope.nvim',
    {
        'nvim-telescope/telescope-project.nvim',
        config = function()
            require('telescope').load_extension('project')
        end,
    },

    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        opts = {},
    },

    {
        'folke/which-key.nvim',
        opts = {},
    },

    {
        'akinsho/toggleterm.nvim',
        opts = {},
    },

    -- indentation guides
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup({ scope = { enabled = false } })
        end,
    },

    -- status line at the bottom
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
        opts = {},
    },

    -- gcc command
    {
        'numToStr/Comment.nvim',
        opts = {},
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'IndianBoy42/tree-sitter-just',

    'alaviss/tree-sitter-nim',
    'alaviss/nim.nvim',
    'jlcrochet/vim-crystal',

    {
        'windwp/nvim-autopairs',
        opts = {},
    },

    -- LSP and autocompletion
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    -- snippet engine (required for nvim-cmp)
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- Isabelle LSP Config
    -- {
    --     dir = '~/Documents/isabelle/isabelle-lsp.nvim'
    -- },
    -- {
    --     dir = '~/Documents/isabelle/isabelle-syn.nvim'
    -- },
    'Treeniks/isabelle-lsp.nvim',
    'Treeniks/isabelle-syn.nvim',

    -- lol
    'eandrju/cellular-automaton.nvim',
})
