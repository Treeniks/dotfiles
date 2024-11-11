local wk = require('which-key')
wk.add({ '<leader>f', group = 'Treesitter' })

vim.opt.smartindent = false

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldlevel = 99 -- open folds by default

return {
    {
        'nvim-treesitter/nvim-treesitter',
        main = 'nvim-treesitter.configs',
        opts = {
            ensure_installed = {
                'lua', 'rust', 'c', 'cpp', 'zig',
                'typst', 'latex', 'markdown', 'markdown_inline',
                'just',
                -- additional deps for noice.nvim
                'vim', 'regex', 'bash'
            },

            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = { enable = true },

            -- from here on inspired by https://www.josean.com/posts/nvim-treesitter-and-textobjects
            -- because nvim-treesitter docs are hot garbage
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<leader><leader>',
                    node_incremental = '<leader><leader>',
                    scope_incremental = false,
                    node_decremental = '<bs>',
                },
            },

            textobjects = {
                select = {
                    enable = true,
                    -- automatically jump forward to textobj
                    lookahead = true,
                    keymaps = {
                        ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
                        ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
                        ['l='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
                        ['r='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },

                        ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter/argument' },
                        ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter/argument' },

                        ['ao'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },
                        ['io'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },

                        ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
                        ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },

                        ['af'] = { query = '@call.outer', desc = 'Select outer part of a function call' },
                        ['if'] = { query = '@call.inner', desc = 'Select inner part of a function call' },

                        ['am'] = { query = '@function.outer', desc = 'Select outer part of a method/function definition' },
                        ['im'] = { query = '@function.inner', desc = 'Select inner part of a method/function definition' },

                        ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
                        ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },
                    },
                },

                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>f]'] = '@parameter.inner', -- swap parameters/argument with next
                        ['<leader>f}'] = '@function.outer',  -- swap function with next
                    },
                    swap_previous = {
                        ['<leader>f['] = '@parameter.inner', -- swap parameters/argument with prev
                        ['<leader>f{'] = '@function.outer',  -- swap function with previous
                    },
                },

                move = {
                    enable = true,
                    set_jumps = false, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        [']f'] = { query = '@call.outer', desc = 'Next function call start' },
                        [']m'] = { query = '@function.outer', desc = 'Next method/function def start' },
                        [']c'] = { query = '@class.outer', desc = 'Next class start' },
                        [']o'] = { query = '@conditional.outer', desc = 'Next conditional start' },
                        [']l'] = { query = '@loop.outer', desc = 'Next loop start' },

                        [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
                        [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
                    },
                    goto_next_end = {
                        [']F'] = { query = '@call.outer', desc = 'Next function call end' },
                        [']M'] = { query = '@function.outer', desc = 'Next method/function def end' },
                        [']C'] = { query = '@class.outer', desc = 'Next class end' },
                        [']I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
                        [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
                    },
                    goto_previous_start = {
                        ['[f'] = { query = '@call.outer', desc = 'Prev function call start' },
                        ['[m'] = { query = '@function.outer', desc = 'Prev method/function def start' },
                        ['[c'] = { query = '@class.outer', desc = 'Prev class start' },
                        ['[o'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
                        ['[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
                    },
                    goto_previous_end = {
                        ['[F'] = { query = '@call.outer', desc = 'Prev function call end' },
                        ['[M'] = { query = '@function.outer', desc = 'Prev method/function def end' },
                        ['[C'] = { query = '@class.outer', desc = 'Prev class end' },
                        ['[I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
                        ['[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
                    },
                },
            },
        },
    },

    'nvim-treesitter/nvim-treesitter-textobjects',

    {
        'nvim-treesitter/nvim-treesitter-context',
        -- only occasionally useful
        opts = { enable = false },
    },
}
