local cmp = require('cmp')
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
local lspkind = require('lspkind')
local luasnip = require('luasnip')

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
        { name = 'luasnip', group_index = 1 },
        { name = 'path', group_index = 1 },
        { name = 'nvim_lsp', group_index = 2 },
        { name = "copilot", group_index = 3 },
    }),

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
