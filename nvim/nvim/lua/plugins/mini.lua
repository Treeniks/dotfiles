local kmset = vim.keymap.set

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
        kmset('', '<leader>e', function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end,
            { desc = 'Mini Files' })

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
