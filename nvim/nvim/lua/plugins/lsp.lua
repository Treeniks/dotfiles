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

                        { '<C-k>',      vim.lsp.buf.hover,                           desc = 'LSP Hover' },
                        { '<leader>lf', vim.lsp.buf.format,                          desc = 'LSP Format' },
                        { '<leader>lr', vim.lsp.buf.format,                          desc = 'LSP Rename' },
                        { '<leader>la', vim.lsp.buf.format,                          desc = 'LSP Code Action' },
                        { 'gd',         vim.lsp.buf.format,                          desc = 'LSP Goto Definition' },
                        { 'gD',         vim.lsp.buf.format,                          desc = 'LSP Goto Declaration' },

                        -- kmset('', '<leader>lR', telescope_builtin.lsp_references, { desc = 'LSP Find References (Telescope)', buffer = event.buf })
                        { '<leader>lR', vim.lsp.buf.references,                      desc = 'LSP Find References' },

                        { '<leader>d',  group = 'Diagnostics' },

                        { '<leader>dk', vim.diagnostic.open_float,                   desc = 'Diagnostic Open Float' },
                        { '<leader>dp', vim.diagnostic.goto_prev,                    desc = 'Diagnostic Goto Previous' },
                        { '<leader>dn', vim.diagnostic.goto_next,                    desc = 'Diagnostic Goto Next' },

                        { '<leader>dh', function() vim.diagnostic.enable(false) end, desc = 'Diagnostic Disable/Hide' },
                        { '<leader>dh', function() vim.diagnostic.enable(true) end,  desc = 'Diagnostic Enable/Show' },
                    })
                end
            })
        end,
    },

    {
        'saghen/blink.cmp',
        version = '0.5.1',
        opts = {
            keymap = {
                ['<Tab>'] = { 'select_and_accept' },
                ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-e>'] = { 'hide' },

                ['<C-p>'] = { 'select_prev', 'fallback' },
                ['<C-n>'] = { 'select_next', 'fallback' },

                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

                ['<C-l>'] = { 'snippet_forward', 'fallback' },
                ['<C-L>'] = { 'snippet_backward', 'fallback' },
            },
        },
    },
}
