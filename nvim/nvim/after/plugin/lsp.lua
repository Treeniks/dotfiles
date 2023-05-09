local lspconfig = require('lspconfig')
local cmp = require('cmp')
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
local luasnip = require('luasnip')

-- setup autocomplete
cmp.setup({
    snippet = {
        expand = function(args)
            -- vim.fn['vsnip#anonymous'](args.body) -- vsnip
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select_opts),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
            elseif luasnip.jumpable() then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable() then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' })
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'path' }
    }),
    preselect = cmp.PreselectMode.Item, -- set to cmp.PreselectMode.None to disable preselect
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- enable language servers
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
})
lspconfig.julials.setup{}

-- set lsp keybinds
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = {buffer = true}

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts)

        vim.keymap.set('n', 'L', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    end
})
