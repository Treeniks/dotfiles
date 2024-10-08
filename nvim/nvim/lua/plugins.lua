-- vi: foldmethod=marker

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
    -- {{{
    'rose-pine/neovim',
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        opt = {
            -- flavour = "mocha"
        }
    },
    {
        'daltonmenezes/aura-theme',
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. '/packages/neovim')
        end,
    },
    {
        'loctvl842/monokai-pro.nvim',
        opts = {
            transparent_background = true,
            filter = 'spectrum',
        },
    },
    'sainnhe/sonokai',
    'EdenEast/nightfox.nvim',
    'kaicataldo/material.vim',
    'folke/tokyonight.nvim',
    'cocopon/iceberg.vim',
    'morhetz/gruvbox',
    {
        'embark-theme/vim',
        name = 'embark',
    },
    'nyoom-engineering/oxocarbon.nvim',
    {
        'olivercederborg/poimandres.nvim',
        opts = {},
    },
    'rebelot/kanagawa.nvim',
    'diegoulloao/neofusion.nvim',
    'projekt0n/github-nvim-theme',
    -- }}}

    -- {
    --     'lervag/vimtex',
    --     lazy = false,
    --     config = function()
    --         vim.g.vimtex_syntax_conceal = {
    --             accents = 1,
    --             ligatures = 1,
    --             cites = 1,
    --             fancy = 1,
    --             spacing = 0,
    --             greek = 1,
    --             math_bounds = 0,
    --             math_delimiters = 1,
    --             math_fracs = 1,
    --             math_super_sub = 1,
    --             math_symbols = 1,
    --             sections = 1,
    --             styles = 1,
    --         }
    --     end,
    -- },

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
    'airblade/vim-matchquote',

    -- doesn't seem to work properly in conjunction with mini.clue
    -- 'mg979/vim-visual-multi',

    'nvim-lua/plenary.nvim',

    {
        'nvim-telescope/telescope.nvim',
        opts = {
            pickers = {
                find_files = {
                    follow = true,
                    hidden = true,
                    no_ignore = true,
                }
            }
        },
    },
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
        'akinsho/toggleterm.nvim',
        opts = {},
    },

    -- indentation guides
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            indent = {
                highlight = 'Comment',
                char = '▏',
                tab_char = '▏'
            },
            scope = {
                enabled = true,
                show_start = false,
                show_end = false,
            },
        },
    },

    -- status line at the bottom
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
        opts = {
            -- options = {
            --     theme = 'monokai-pro',
            -- },
        },
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
    'fladson/vim-kitty',

    -- I'm undecided between these two
    -- 'easymotion/vim-easymotion',
    'ggandor/leap.nvim',

    {
        'windwp/nvim-autopairs',
        config = function()
            local autopairs = require('nvim-autopairs')
            autopairs.setup()
            autopairs.remove_rule('`')
        end,
    },

    {
        'MeanderingProgrammer/markdown.nvim',
        opts = {},
        -- enabled = false,
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        "NStefan002/screenkey.nvim",
        cmd = "Screenkey",
        opts = {},
    },
    {
        'RaafatTurki/corn.nvim',
        -- while it moves out of the way for lines at the very top,
        -- it does not do so correctly when wrapping is on, in which case it does get in the way
        enabled = false,
        opts = {
            -- item_preprocess_func = function(item)
            --     -- the default truncation logic is here ...
            --     return item
            -- end,
        },
    },

    {
        'echasnovski/mini.nvim',
        config = function()
            require('mini.files').setup({
                windows = {
                    preview = true,
                },

                mappings = {
                    go_in = 'L',
                    go_in_plus = 'l',
                },
            })

            require('mini.map').setup({})
            require('mini.starter').setup({
                autoopen = false,
            })
            -- should only be done on-demand with <leader>mt
            -- MiniMap.open()

            -- mini.clue setup is in remap file

            require('mini.align').setup({})
            require('mini.icons').setup({})
            require('mini.cursorword').setup({})
        end,
    },

    -- LSP and autocompletion
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    -- snippet engine (required for nvim-cmp)
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    'onsails/lspkind.nvim',

    'barreiroleo/ltex_extra.nvim',

    {
        'folke/neodev.nvim',
        opts = {},
    },

    {
        'zbirenbaum/copilot.lua',
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
        },
    },
    {
        'zbirenbaum/copilot-cmp',
        opts = {},
    },

    -- Isabelle LSP Config
    {
        dir = '~/Documents/isabelle/isabelle-lsp.nvim',
        opts = {
            unicode_symbols_output = true,
            unicode_symbols_edits = true,
        },
    },
    {
        dir = '~/Documents/isabelle/isabelle-syn.nvim',
    },
    -- {
    --     'Treeniks/isabelle-lsp.nvim',
    --     opts = {},
    -- },
    -- 'Treeniks/isabelle-syn.nvim',

    -- lol
    'eandrju/cellular-automaton.nvim',
})
