local kmset = vim.keymap.set

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
                    kmset('', '<C-k>', vim.lsp.buf.hover, { desc = 'LSP Hover', buffer = event.buf })
                    kmset('', '<leader>lf', vim.lsp.buf.format,
                        { desc = 'LSP Format', buffer = event.buf })
                    kmset('', '<leader>lr', vim.lsp.buf.format,
                        { desc = 'LSP Rename', buffer = event.buf })
                    kmset('', '<leader>la', vim.lsp.buf.format,
                        { desc = 'LSP Code Action', buffer = event.buf })
                    kmset('', 'gd', vim.lsp.buf.format,
                        { desc = 'LSP Goto Definition', buffer = event.buf })
                    kmset('', 'gD', vim.lsp.buf.format,
                        { desc = 'LSP Goto Declaration', buffer = event.buf })

                    -- kmset('', '<leader>lR', telescope_builtin.lsp_references, { desc = 'LSP Find References (Telescope)', buffer = event.buf })
                    kmset('', '<leader>lR', vim.lsp.buf.references,
                        { desc = 'LSP Find References', buffer = event.buf })

                    kmset('', '<leader>dk', vim.diagnostic.open_float,
                        { desc = 'Diagnostic Open Float', buffer = event.buf })
                    kmset('', '<leader>dp', vim.diagnostic.goto_prev,
                        { desc = 'Diagnostic Goto Previous', buffer = event.buf })
                    kmset('', '<leader>dn', vim.diagnostic.goto_next,
                        { desc = 'Diagnostic Goto Next', buffer = event.buf })

                    kmset('', '<leader>dh', function() vim.diagnostic.enable(false) end,
                        { desc = 'Diagnostic Disable/Hide', buffer = event.buf })
                    kmset('', '<leader>dh', function() vim.diagnostic.enable(true) end,
                        { desc = 'Diagnostic Enable/Show', buffer = event.buf })
                end
            })
        end,
    },
}
