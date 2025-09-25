local wk = require('which-key')

return {
    {
        'neovim/nvim-lspconfig',
        config = function(_, opts)
            local lspconfig = require('lspconfig')
            local telescope_builtin = require('telescope.builtin')

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(event)
                    wk.add({
                        { '<leader>l',  group = 'LSP' },

                        { '<C-k>',      vim.lsp.buf.hover,  desc = 'Hover' },
                        { '<leader>lf', vim.lsp.buf.format, desc = 'Format' },
                        {
                            '<S-M-f>',
                            vim.lsp.buf.format,
                            desc = 'Format',
                            mode = { 'n', 'v', 'i' }
                        },
                        { '<leader>la', vim.lsp.buf.code_action,     desc = 'Code Action' },
                        { 'gd',         vim.lsp.buf.definition,      desc = 'Goto Definition' },
                        { '<leader>lt', vim.lsp.buf.type_definition, desc = 'Goto Type Definition' },
                        { 'gD',         vim.lsp.buf.declaration,     desc = 'Goto Declaration' },

                        { '<leader>d',  group = 'Diagnostics' },

                        { '<leader>dk', vim.diagnostic.open_float,   desc = 'Open Float' },
                        {
                            '<leader>dp',
                            function()
                                vim.diagnostic.jump({
                                    diagnostic = vim.diagnostic.get_prev(),
                                    float = { border = 'rounded' },
                                })
                            end,
                            desc = 'Goto Previous'
                        },
                        {
                            '<leader>dn',
                            function()
                                vim.diagnostic.jump({
                                    diagnostic = vim.diagnostic.get_next(),
                                    float = { border = 'rounded' },
                                })
                            end,
                            desc = 'Goto Next'
                        },

                        { '<leader>dh', function() vim.diagnostic.enable(false) end, desc = 'Disable/Hide' },
                        { '<leader>ds', function() vim.diagnostic.enable(true) end,  desc = 'Enable/Show' },

                        -- Telescope
                        { '<leader>lR', telescope_builtin.lsp_references,            desc = 'Find References' },
                        { '<leader>ls', telescope_builtin.lsp_document_symbols,      desc = 'LSP Document Symbols' },
                    })

                    -- IncRename
                    -- `wk.add` does not support `expr = true`
                    vim.keymap.set('n', '<leader>lr', function()
                        return ':IncRename ' .. vim.fn.expand('<cword>')
                    end, { expr = true, desc = 'IncRename' })
                end
            })

            -- local cmp = require('cmp_nvim_lsp')
            local blink = require('blink.cmp')
            for server, config in pairs(opts.servers or {}) do
                if opts.setup[server] then
                    opts.setup[server]()
                end
                -- config.capabilities = cmp.default_capabilities()
                config.capabilities = blink.get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end
        end,
        opts = {
            servers = {
                clojure_lsp = {},
                zls = {},
                rust_analyzer = {},
                clangd = {
                    on_attach = function()
                        wk.add({
                            '<leader>lh',
                            ':ClangdSwitchSourceHeader<CR>',
                            desc = 'Clangd Source/Header',
                        })
                    end,
                },
                pyright = {},
                mojo = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = { disable = { 'missing-fields' } }, -- lots of false positives
                        },
                    },
                },
                slint_lsp = {},
            },
            -- list of functions that get called before setting up the server
            -- (used primarily for isabelle-lsp.nvim)
            setup = {},
        },
    },

    {
        'folke/lazydev.nvim',
        version = false, -- blink source only exists in latest git it seems
        ft = 'lua',
        opts = {},
    },

    -- for isabelle
    -- see https://github.com/Saghen/blink.cmp/issues/2173
    -- {
    --     'hrsh7th/nvim-cmp',
    --     config = function(_, opts)
    --         local cmp = require('cmp')
    --         local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
    --         local luasnip = require('luasnip')
    --
    --         cmp.setup({
    --             snippet = {
    --                 expand = function(args)
    --                     -- vim.fn['vsnip#anonymous'](args.body) -- vsnip
    --                     luasnip.lsp_expand(args.body) -- For `luasnip` users.
    --                     -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    --                     -- vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
    --                 end,
    --             },
    --
    --             window = {
    --                 completion = cmp.config.window.bordered(),
    --                 documentation = cmp.config.window.bordered(),
    --             },
    --
    --             mapping = {
    --                 ['<C-Space>'] = cmp.mapping.complete(),
    --                 ['<C-e>'] = cmp.mapping.abort(),
    --                 ['<C-n>'] = cmp.mapping.select_next_item(cmp_select_opts),
    --                 ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select_opts),
    --                 ['<Tab>'] = cmp.mapping(function(fallback)
    --                     if cmp.visible() then
    --                         cmp.confirm({ select = true })
    --                     else
    --                         fallback()
    --                     end
    --                 end, { 'i', 's' }),
    --                 -- jumping between snippet positions is on a different keybind
    --                 -- because otherwise it would jump to previous snippet positions
    --                 -- when trying to just write a tab somewhere else
    --                 ['<C-l>'] = cmp.mapping(function(fallback)
    --                     if luasnip.expand_or_jumpable() then
    --                         luasnip.expand_or_jump()
    --                     else
    --                         fallback()
    --                     end
    --                 end, { 'i', 's' }),
    --                 ['<C-h>'] = cmp.mapping(function(fallback)
    --                     if luasnip.jumpable(-1) then
    --                         luasnip.jump(-1)
    --                     else
    --                         fallback()
    --                     end
    --                 end, { 'i', 's' }),
    --             },
    --
    --             sources = cmp.config.sources({
    --                 { name = 'luasnip',  priorty = 8 },
    --                 { name = 'nvim_lsp', priorty = 4 },
    --                 { name = 'path',     priorty = 2 },
    --                 { name = 'copilot',  priority = 0 },
    --             }),
    --
    --             -- default is defined here:
    --             -- https://github.com/hrsh7th/nvim-cmp/blob/a110e12d0b58eefcf5b771f533fc2cf3050680ac/lua/cmp/config/default.lua#L65
    --             sorting = {
    --                 priority_weight = 2, -- 2 is the default
    --
    --                 -- -- this is the default fro comparators:
    --                 -- compare.offset,
    --                 -- compare.exact,
    --                 -- -- compare.scopes,
    --                 -- compare.score,
    --                 -- compare.recently_used,
    --                 -- compare.locality,
    --                 -- compare.kind,
    --                 -- -- compare.sort_text,
    --                 -- compare.length,
    --                 -- compare.order,
    --
    --                 -- comparator descriptions can be found here:
    --                 -- https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/compare.lua
    --                 comparators = {
    --                     cmp.config.compare.exact,
    --
    --                     cmp.config.compare.recently_used,
    --                     cmp.config.compare.locality,
    --                     cmp.config.compare.score,
    --                     cmp.config.compare.offset,
    --                     cmp.config.compare.order,
    --
    --                     cmp.config.compare.kind,
    --                 },
    --             },
    --
    --             preselect = cmp.PreselectMode.Item, -- set to cmp.PreselectMode.None to disable preselect
    --         })
    --     end,
    -- },
    -- 'hrsh7th/cmp-nvim-lsp',
    -- 'hrsh7th/cmp-path',
    -- -- snippet engine (required for nvim-cmp)
    -- 'L3MON4D3/LuaSnip',
    -- 'saadparwaiz1/cmp_luasnip',

    {
        'saghen/blink.cmp',
        lazy = false,
        dependencies = 'rafamadriz/friendly-snippets',
        opts = {
            keymap = {
                ['<Tab>'] = { 'select_and_accept', 'fallback' },
                ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-e>'] = { 'hide', 'hide_documentation', 'hide_signature', 'fallback' },

                ['<C-p>'] = { 'select_prev', 'fallback' },
                ['<C-n>'] = { 'select_next', 'fallback' },

                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

                ['<C-l>'] = { 'snippet_forward' },
                ['<C-L>'] = { 'snippet_backward' },
            },

            completion = {
                menu = {
                    border = 'rounded',
                    draw = { treesitter = { 'lsp' } },
                },
                documentation = { window = { border = 'rounded' } },
            },

            cmdline = { enabled = true },

            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority
                        score_offset = 100,
                    },
                },
            },

            signature = {
                enabled = true,
                window = { border = 'rounded' },
            },
        },

        -- allows extending the sources elsewhere in your config
        -- without having to redefining it (not actually used in my config currently)
        -- TODO: probably should enable lazydev with that
        opts_extend = { 'sources.default' },
    },

    { 'smjonas/inc-rename.nvim', opts = {} },
}
