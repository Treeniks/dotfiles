return {
    { dir = '~/Documents/isabelle/isabelle-syn.nvim' },

    {
        dir = '~/Documents/isabelle/isabelle-lsp.nvim',
        config = function()
            require('isabelle-lsp').setup({
                unicode_symbols_output = true,
                unicode_symbols_edits = true,
            })

            local lspconfig = require('lspconfig')
            lspconfig.isabelle.setup({})
        end,
    },
}
