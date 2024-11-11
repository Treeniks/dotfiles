local wk = require('which-key')

return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({})
        local builtin = require('telescope.builtin')
        wk.add({
            { '<leader>t',  group = 'Telescope' },

            { '<leader>tf', builtin.find_files, desc = 'Find Files' },
            { '<leader>tg', builtin.live_grep,  desc = 'Live Grep' },
            { '<leader>tb', builtin.buffers,    desc = 'Buffers' },
            { '<leader>th', builtin.help_tags,  desc = 'Help Tags' },
        })
    end,
}
