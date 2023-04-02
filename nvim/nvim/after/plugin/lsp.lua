local lsp = require('lsp-zero')

vim.keymap.set('n', '<leader>lf', vim.cmd.LspZeroFormat)

lsp.preset('manual-setup')

lsp.setup_servers({
    'rust_analyzer', 'zls', 'clangd', force = true
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false,
    })
end)

lsp.setup()

-- modify autocomplete keymap
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    source = {
        {name = 'path'},
        {name = 'nvim_lsp'},
    },
    preselect = cmp.PreselectMode.Item,
    completion = {
        completeopt = 'menuone,noinsert,preview',
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(), -- doesn't seem to work in wezterm
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.confirm()
            else
                fallback()
            end
        end
    }
})

