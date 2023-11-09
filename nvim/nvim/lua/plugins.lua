-- install lazy.nvim
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

-- setup lazy.nvim and add all plugins
require("lazy").setup({
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
        "daltonmenezes/aura-theme",
        lazy = false,
        priority = 1000,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. '/packages/neovim')
        end,
    },

    -- Mastering the vim language plugins
    "tpope/vim-surround",
    "christoomey/vim-system-copy",
    "vim-scripts/ReplaceWithRegister",

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    'nvim-telescope/telescope-project.nvim',

    'folke/which-key.nvim',

    'akinsho/toggleterm.nvim',

    'lukas-reineke/indent-blankline.nvim',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
    },

    'numToStr/Comment.nvim',

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'IndianBoy42/tree-sitter-just',

    'windwp/nvim-autopairs',

    -- LSP and autocompletion
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',

    -- Isabelle LSP Config
    -- {
    --     dir = '~/Documents/isar-lsp.nvim'
    -- },

    -- snippet engine (required for nvim-cmp)
    'L3MON4D3/LuaSnip',
})
