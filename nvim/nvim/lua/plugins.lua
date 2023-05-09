return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'rose-pine/neovim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use 'nvim-telescope/telescope-project.nvim'

    use 'folke/which-key.nvim'

    use { 'akinsho/toggleterm.nvim', tag = '*' }

    use 'lukas-reineke/indent-blankline.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'numToStr/Comment.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    }
    use 'nvim-treesitter/nvim-treesitter-context'

    use 'windwp/nvim-autopairs'

    -- LSP and autocompletion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'

    -- snippet engine (required for nvim-cmp)
    use 'L3MON4D3/LuaSnip'
end)
