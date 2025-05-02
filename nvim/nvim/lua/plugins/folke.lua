return {
    { 'folke/lazy.nvim' },

    -- realistically only here for the terminal functionality
    -- and I'm not too convinced by even that
    {
        'folke/snacks.nvim',
        lazy = false,
        opts = {
            notifier = { enabled = false }, -- noice's mini notifications are less distracting
            words = { enabled = false },    -- mini.cursorword
            explorer = {
                enabled = true,
                layout = {
                    auto_hide = { "input" },
                },
            },
            picker = {
                sources = {
                    explorer = {
                        layout = { auto_hide = { "input" } },
                    },
                },
            },
        },
        keys = {
            { '<leader>bd', function() Snacks.bufdelete() end, desc = 'Delete Buffer' },
            -- maybe replace with mini.terminal once that's out?
            { '<C-\\>',     function() Snacks.terminal() end,  mode = { 'n', 'v', 'i', 't' }, desc = 'Open Terminal' },
            {
                '<leader>e',
                function()
                    explorer = Snacks.picker.get({ source = 'explorer' })[1]
                    if explorer then
                        explorer:focus()
                    else
                        Snacks.explorer()
                    end
                end,
                desc = 'Open Snacks Explorer'
            },
        },
    },

    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        -- enabled = false,
        opts = {
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = false,
                inc_rename = true,
                lsp_doc_border = false,
            },

            -- for a normal command line
            -- also recommend disabling `command_palette` above in that case
            -- cmdline = {
            --     view = 'cmdline',
            -- },

            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                },

                -- let blink handle it iself
                signature = { enabled = false },
            },
        },

        dependencies = {
            'MunifTanjim/nui.nvim',
            -- way too noisy, I'd rather use the mini backend
            -- 'rcarriga/nvim-notify',
        },

        keys = {
            -- https://github.com/folke/noice.nvim/issues/341
            {
                '<C-e>',
                function()
                    local nldocs = require('noice.lsp.docs')
                    local message = nldocs.get('signature')
                    nldocs.hide(message)
                end,
                mode = 'i',
                desc = 'Close Signature Help'
            }
        },
    },

    { 'folke/twilight.nvim', opts = {} },

    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            preset = 'helix',
            delay = 0,
            triggers = {
                { '<auto>', mode = 'nixsotc' },
                { 'y',      mode = 'n' }, -- surround
            },
            spec = {
                { '<leader>b', group = 'Buffer' },
                { '<leader>m', group = 'Misc' },
                -- I'd rather have this together with Telescope's config
                -- but idk how lazy.nvim and which-key are supposed to be
                -- working together wrt keybind groups.
                { '<leader>t', group = 'Telescope' },
            },
        },
    },
}
