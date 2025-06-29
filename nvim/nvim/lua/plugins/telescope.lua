local open_with_trouble = require('trouble.sources.telescope').open

return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        defaults = {
            mappings = {
                i = { ['<C-t>'] = open_with_trouble },
                n = { ['<C-t>'] = open_with_trouble },
            },
        },
    },
    keys = {
        { '<leader>tf', function() require('telescope.builtin').find_files() end, desc = 'Find Files' },
        { '<leader>tg', function() require('telescope.builtin').live_grep() end,  desc = 'Live Grep' },
        { '<leader>tb', function() require('telescope.builtin').buffers() end,    desc = 'Buffers' },
        { '<leader>th', function() require('telescope.builtin').help_tags() end,  desc = 'Help Tags' },
    },
}
