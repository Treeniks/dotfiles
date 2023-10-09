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
    -- color scheme
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
    'IndianBoy42/tree-sitter-just',

    'windwp/nvim-autopairs',

    -- LSP and autocompletion
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',

    -- snippet engine (required for nvim-cmp)
    'L3MON4D3/LuaSnip',
})

require('remap')

vim.cmd.colorscheme('rose-pine')
-- vim.cmd.colorscheme('aura-dark')
-- light theme
-- vim.cmd.colorscheme('catppuccin_latte')
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.g.neovide_transparency = 0.95
vim.opt.guifont = 'JetBrains Mono:h16'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4
vim.opt.signcolumn = 'yes' -- stops constant shifting because of LSP diagnostics
