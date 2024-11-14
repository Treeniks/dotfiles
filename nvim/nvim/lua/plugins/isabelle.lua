return {
    { dir = '~/Documents/isabelle/isabelle-syn.nvim' },

    { dir = '~/Documents/isabelle/isabelle-lsp.nvim' },

    {
        'neovim/nvim-lspconfig',
        opts = {
            servers = { isabelle = {} },
            setup = {
                isabelle = function()
                    -- I think ideally the isabelle language server would take
                    -- settings the same way other servers would, but idk how other
                    -- server actually get their settings exactly...
                    require('isabelle-lsp').setup({
                        unicode_symbols_output = true,
                        unicode_symbols_edits = true,
                    })
                end,
            },
        },
    },
}
