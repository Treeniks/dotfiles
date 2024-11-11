local wk = require('which-key')

return {
    'echasnovski/mini.nvim',
    version = '0.14.0',
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
            { '<leader>e', function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end, desc = 'Mini Files' },
        })

        require('mini.ai').setup({})
        require('mini.bracketed').setup({})
        require('mini.cursorword').setup({})
        require('mini.diff').setup({})
        require('mini.git').setup({})
        require('mini.icons').setup({})
        require('mini.jump').setup({})
        require('mini.jump2d').setup({})
        require('mini.move').setup({})
        -- replaced by noice
        -- require('mini.notify').setup({})
        require('mini.operators').setup({})
        require('mini.pairs').setup({})
        require('mini.splitjoin').setup({})
        -- using lualine for now
        -- require('mini.statusline').setup({})
        require('mini.surround').setup({})
        -- unsure
        -- require('mini.tabline').setup({})
        require('mini.trailspace').setup({})
    end,
}
