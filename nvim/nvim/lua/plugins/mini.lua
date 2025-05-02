local wk = require('which-key')

return {
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
        wk.add({
            { '<leader>E', function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end, desc = 'Mini Files' },
        })

        -- example config from https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-hipatterns.md
        local hipatterns = require('mini.hipatterns')
        hipatterns.setup({
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

                -- Highlight hex color strings (`#rrggbb`) using that color
                hex_color = hipatterns.gen_highlighter.hex_color(),
            },
        })

        require('mini.pairs').setup({})
        -- remove these as they cause issues more often than not
        MiniPairs.unmap('i', '"', '""')
        MiniPairs.unmap('i', "'", "''")
        MiniPairs.unmap('i', '`', '``')

        require('mini.ai').setup({})
        require('mini.bracketed').setup({})
        require('mini.comment').setup({})
        require('mini.cursorword').setup({})
        require('mini.diff').setup({})
        require('mini.git').setup({})
        require('mini.icons').setup({})
        -- disabled because it's distracting
        -- require('mini.jump').setup({})
        require('mini.jump2d').setup({})
        require('mini.move').setup({})

        -- replaced by noice
        -- require('mini.notify').setup({})

        require('mini.operators').setup({})
        require('mini.splitjoin').setup({})

        -- using lualine for now
        -- require('mini.statusline').setup({})

        -- I prefer normal surround keybinds
        -- require('mini.surround').setup({})

        -- unsure
        -- require('mini.tabline').setup({})

        require('mini.trailspace').setup({})
    end,
}
