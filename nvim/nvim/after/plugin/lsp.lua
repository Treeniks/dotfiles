local lsp = require('lsp-zero')

vim.keymap.set('n', '<leader>lf', vim.cmd.LspZeroFormat)

lsp.preset('manual-setup')

lsp.setup_servers({
    'rust_analyzer', 'zls', 'clangd', force = true
})

-- modify autocomplete keymap
local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings()

cmp_mappings['<CR>'] = nil
cmp_mappings['<Tab>'] = function(fallback)
    if cmp.visible() then
        cmp.confirm()
    else
        fallback()
    end
end
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'}
    }
})

lsp.setup()
