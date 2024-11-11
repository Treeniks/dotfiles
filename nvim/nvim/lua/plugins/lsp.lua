local wk = require('which-key')

return {
    {
        'neovim/nvim-lspconfig',
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

            local telescope_builtin = require('telescope.builtin')
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(event)
                    wk.add({
                        { '<leader>l',  group = 'LSP' },

                        { '<C-k>',      vim.lsp.buf.hover,                           desc = 'Hover' },
                        { '<leader>lf', vim.lsp.buf.format,                          desc = 'Format' },
                        { '<leader>la', vim.lsp.buf.code_action,                     desc = 'Code Action' },
                        { 'gd',         vim.lsp.buf.definition,                      desc = 'Goto Definition' },
                        { 'gD',         vim.lsp.buf.declaration,                     desc = 'Goto Declaration' },

                        { '<leader>d',  group = 'Diagnostics' },

                        { '<leader>dk', vim.diagnostic.open_float,                   desc = 'Open Float' },
                        { '<leader>dp', vim.diagnostic.goto_prev,                    desc = 'Goto Previous' },
                        { '<leader>dn', vim.diagnostic.goto_next,                    desc = 'Goto Next' },

                        { '<leader>dh', function() vim.diagnostic.enable(false) end, desc = 'Disable/Hide' },
                        { '<leader>ds', function() vim.diagnostic.enable(true) end,  desc = 'Enable/Show' },

                        -- Telescope
                        { '<leader>lR', telescope_builtin.lsp_references,            desc = 'Find References' },
                        { '<leader>ls', telescope_builtin.lsp_document_symbols,      desc = 'LSP Document Symbols' },
                    })

                    -- IncRename
                    -- `wk.add` does not support `expr = true`
                    vim.keymap.set('n', '<leader>lr', function()
                        return ':IncRename ' .. vim.fn.expand('<cword>')
                    end, { expr = true, desc = 'IncRename' })
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

            -- not sure what it does or doesn't work
            accept = { auto_brackets = { enabled = true } },

            -- handled by noice
            -- trigger = { signature_help = { enabled = true } },

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

    { 'smjonas/inc-rename.nvim', opts = {} },
}
