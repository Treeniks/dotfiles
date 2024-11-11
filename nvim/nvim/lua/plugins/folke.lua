return {
    {
        'folke/lazy.nvim',
        version = '*',
    },

    -- realistically only here for the terminal functionality
    -- and I'm not too convinced by even that
    {
        'folke/snacks.nvim',
        version = '1.2.0',
        priority = 999,
        opts = {
            notifier = { enabled = false }, -- noice's mini notifications are less distracting
            words = { enabled = false },    -- mini.cursorword
        },
        keys = {
            { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
            -- maybe replace with mini.terminal once that's out?
            { '<C-\\>',     function() Snacks.terminal() end,  mode = { 'n', 'v', 'i', 't' }, desc = 'Open Terminal' },
        },
    },

    {
        'folke/noice.nvim',
        version = '4.7.0',
        opts = {
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = false,
                inc_rename = true,
                lsp_doc_border = true,
            },

            -- for a normal command line
            -- also recommend disabling `command_palette` above in that case
            -- cmdline = {
            --     view = "cmdline",
            -- },

            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true,
                },
            },
        },

        dependencies = {
            'MunifTanjim/nui.nvim',
            -- way too noisy, I'd rather use the mini backend
            -- "rcarriga/nvim-notify",
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
            },
            spec = {
                { '<leader>b', group = 'Buffer' },
                { '<leader>m', group = 'Misc' },
            },
        },
    },
}
