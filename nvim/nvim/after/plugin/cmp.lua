local cmp = require('cmp')
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
local lspkind = require('lspkind')
local luasnip = require('luasnip')

-- disable Copilot by default
vim.cmd('Copilot disable')

-- setup autocomplete
cmp.setup({
    snippet = {
        expand = function(args)
            -- vim.fn['vsnip#anonymous'](args.body) -- vsnip
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
        end,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select_opts),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
            else
                fallback()
            end
        end, { 'i', 's' }),
        -- jumping between snippet positions is on a different keybind
        -- because otherwise it would jump to previous snippet positions
        -- when trying to just write a tab somewhere else
        ['<C-l>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },

    sources = cmp.config.sources({
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'copilot' },
    }),

    sorting = {
        priority_weight = 1,
        comparators = {
            cmp.config.compare.exact,

            -- main ones that should be used
            -- order uses the order in which sources are declared
            cmp.config.compare.order,

            cmp.config.compare.locality,
            cmp.config.compare.scopes,
            cmp.config.compare.recently_used,
            -- fallback (should be rare)
            cmp.config.compare.kind,
            cmp.config.compare.score,

            cmp.config.compare.length,
            -- the rest that are shit
            -- cmp.config.compare.offset,
            -- cmp.config.compare.sort_text,
        },
    },

    preselect = cmp.PreselectMode.Item, -- set to cmp.PreselectMode.None to disable preselect

    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            symbol_map = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰜢",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "",
                Copilot = "",
            },
        }),
    },
})
