local wk = require('which-key')

return {
    {
        'neovim/nvim-lspconfig',
        version = '1.0.0',
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            disable = { 'missing-fields' } -- lots of false-positives
                        }
                    }
                }
            })

            lspconfig.rust_analyzer.setup({})
            lspconfig.clangd.setup({})

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(event)
                    wk.add({
                        { '<leader>l',  group = 'LSP' },

                        { '<C-k>',      vim.lsp.buf.hover,                           desc = 'Hover' },
                        { '<leader>lf', vim.lsp.buf.format,                          desc = 'Format' },
                        { '<leader>la', vim.lsp.buf.code_action,                     desc = 'Code Action' },
                        { 'gd',         vim.lsp.buf.definition,                      desc = 'Goto Definition' },
                        { 'gD',         vim.lsp.buf.declaration,                     desc = 'Goto Declaration' },

                        -- find_references keybind is in telescope config

                        { '<leader>d',  group = 'Diagnostics' },

                        { '<leader>dk', vim.diagnostic.open_float,                   desc = 'Open Float' },
                        { '<leader>dp', vim.diagnostic.goto_prev,                    desc = 'Goto Previous' },
                        { '<leader>dn', vim.diagnostic.goto_next,                    desc = 'Goto Next' },

                        { '<leader>dh', function() vim.diagnostic.enable(false) end, desc = 'Disable/Hide' },
                        { '<leader>ds', function() vim.diagnostic.enable(true) end,  desc = 'Enable/Show' },
                    })
                end
            })
        end,
    },

    {
        'folke/lazydev.nvim',
        version = false, -- blink source only exists in latest git it seems
        ft = 'lua',
        opts = {},
    },

    {
        'saghen/blink.cmp',
        version = '0.5.1',
        opts = {
            keymap = {
                ['<Tab>'] = { 'select_and_accept', 'fallback' },
                ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-e>'] = { 'hide', 'fallback' },

                ['<C-p>'] = { 'select_prev', 'fallback' },
                ['<C-n>'] = { 'select_next', 'fallback' },

                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

                ['<C-l>'] = { 'snippet_forward', 'fallback' },
                ['<C-L>'] = { 'snippet_backward', 'fallback' },
            },

            sources = {
                completion = { enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' } },
                providers = {
                    lsp = { fallback_for = { 'lazydev' } },
                    lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink' },
                },
            },

            windows = {
                autocomplete = { border = 'rounded' },
                documentation = { border = 'rounded' },
                signature_help = { border = 'rounded' },
            },
        },
    },

    {
        'smjonas/inc-rename.nvim',
        config = function()
            require('inc_rename').setup({})
            -- `wk.add` does not support `expr = true`
            vim.keymap.set('n', '<leader>lr', function()
                return ':IncRename ' .. vim.fn.expand('<cword>')
            end, { expr = true, desc = 'IncRename' })
        end,
    },
}
