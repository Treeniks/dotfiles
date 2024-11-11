return {
    {
        'folke/lazy.nvim',
        version = '*',
    },

    {
        'folke/noice.nvim',
        version = '4.7.0',
        opts = {
            presets = {
                bottom_search = false,
                command_palette = false,
                long_message_to_split = false,
                inc_rename = true,
                lsp_doc_border = true,
            },
        },
    },

    {
        'folke/todo-comments.nvim',
        version = '1.4.0',
        opts = {},
    },

    {
        'folke/twilight.nvim',
        version = '1.0.0',
        opts = {},
    },

    {
        'folke/which-key.nvim',
        version = '3.13.3',
        opts = {
            preset = 'helix',
            delay = 0,
            triggers = {
                { '<auto>', mode = 'nixsotc' },
                { 's',      mode = 'n' }, -- mini.surround
            }
        },
    },
}
