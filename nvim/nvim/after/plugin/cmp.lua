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
        { name = 'luasnip', priorty = 8 },
        { name = 'nvim_lsp', priorty = 4 },
        { name = 'path', priorty = 2 },
        { name = 'copilot', priority = 0 },
    }),

    -- default is defined here:
    -- https://github.com/hrsh7th/nvim-cmp/blob/a110e12d0b58eefcf5b771f533fc2cf3050680ac/lua/cmp/config/default.lua#L65
    sorting = {
        priority_weight = 2, -- 2 is the default

        -- -- this is the default fro comparators:
        -- compare.offset,
        -- compare.exact,
        -- -- compare.scopes,
        -- compare.score,
        -- compare.recently_used,
        -- compare.locality,
        -- compare.kind,
        -- -- compare.sort_text,
        -- compare.length,
        -- compare.order,

        -- comparator descriptions can be found here:
        -- https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/compare.lua
        comparators = {
            cmp.config.compare.exact,

            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.score,
            cmp.config.compare.offset,
            cmp.config.compare.order,

            cmp.config.compare.kind,
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
