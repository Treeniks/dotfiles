local kmset = vim.keymap.set

return {
    'echasnovski/mini.nvim',
    version = false,
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
        kmset('', '<leader>e', function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end,
            { desc = 'Mini Files' })

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

        require('mini.ai').setup({})
        require('mini.bracketed').setup({})
        require('mini.cursorword').setup({})
        require('mini.diff').setup({})
        require('mini.icons').setup({})
        require('mini.jump').setup({})
        require('mini.jump2d').setup({})
        require('mini.move').setup({})
        require('mini.notify').setup({})
        require('mini.operators').setup({})
        require('mini.pairs').setup({})
        require('mini.splitjoin').setup({})
        require('mini.statusline').setup({})
        require('mini.surround').setup({})
        require('mini.tabline').setup({})
    end,
}
