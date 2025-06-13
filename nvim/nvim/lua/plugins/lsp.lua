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
                        { '<leader>la', vim.lsp.buf.code_action,   desc = 'Code Action' },
                        { 'gd',         vim.lsp.buf.definition,    desc = 'Goto Definition' },
                        { 'gD',         vim.lsp.buf.declaration,   desc = 'Goto Declaration' },

                        { '<leader>d',  group = 'Diagnostics' },

                        { '<leader>dk', vim.diagnostic.open_float, desc = 'Open Float' },
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

            local blink = require('blink.cmp')
            for server, config in pairs(opts.servers or {}) do
                if opts.setup[server] then
                    opts.setup[server]()
                end
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

    {
        'saghen/blink.cmp',
        lazy = false,
        dependencies = 'rafamadriz/friendly-snippets',
        opts = {
            keymap = {
                ['<Tab>'] = { 'select_and_accept', 'fallback' },
                ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-e>'] = { 'hide', 'hide_documentation', 'hide_signature', 'fallback' },

                ['<C-p>'] = { 'select_prev', 'fallback' },
                ['<C-n>'] = { 'select_next', 'fallback' },

                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

                ['<C-l>'] = { 'snippet_forward', 'fallback' },
                ['<C-L>'] = { 'snippet_backward', 'fallback' },
            },

            completion = {
                menu = {
                    border = 'rounded',
                    draw = { treesitter = { 'lsp' } },
                },
                documentation = { window = { border = 'rounded' } },
            },

            -- no keybind to hide it unfortunately
            -- also super buggy so no thank you
            -- signature = {
            --     enabled = true,
            --     window = { border = 'rounded' }
            -- },

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
