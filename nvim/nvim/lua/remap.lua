local wk = require('which-key')
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local luasnip = require('luasnip')

local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')

vim.g.mapleader = ' '

wk.register({
    ['<C-s>'] = { vim.cmd.write, 'Save' },
}, { mode = {'n', 'i'} })

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

wk.register({
    e = {
        vim.cmd.Ex,
        'Ex',
    },
    r = {
        function() vim.cmd.Ex('.') end,
        'Ex in CWD',
    },

    -- Telescope Keybinds
    t = {
        name = 'Telescope',
        p = { telescope.extensions.project.project, 'Project' },
        f = { telescope_builtin.find_files, 'Files' },
        g = { telescope_builtin.git_files, 'Git Files' },
        s = {
            function() telescope_builtin.grep_string({ search = vim.fn.input('Grep > ') }) end,
            'Grep Search',
        },
        b = { telescope_builtin.buffers, 'Buffers' },
    },

    -- Harpoon Keybinds
    h = {
        name = 'Harpoon',
        m = { harpoon_mark.add_file, 'Mark' },
        f = { harpoon_ui.toggle_quick_menu, 'Quick Menu' },
        n = { harpoon_ui.nav_next, 'Next' },
        p = { harpoon_ui.nav_prev, 'Prev' },
    },
}, { prefix = '<leader>' })

-- toogleterm
wk.register({
    ['<C-\\>'] = { function() vim.cmd.ToggleTerm('direction=float') end, 'Open Floating Terminal' },
}, { mode = {'n', 't'} })

-- Default Keybind to go into Normal Mode while in Terminal Mode is <C-\><C-n>
wk.register({
    ['<Esc>'] = { '<C-\\><C-n>', 'Exit Terminal Mode' },
}, { mode = {'t'} })

-- lsp keybinds
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP Actions',
    callback = function(event)
        local opts = {buffer = true}

        wk.register({
            l = {
                name = 'LSP Actions',
                k = { vim.lsp.buf.hover, 'Hover', opts },
                f = { vim.lsp.buf.format, 'Format', opts },
                r = { vim.lsp.buf.rename, 'Rename', opts },
                a = { vim.lsp.buf.code_action, 'Code Action', opts },
                g = {
                    name = 'Goto',
                    d = { vim.lsp.buf.definition, 'Goto Definition', opts },
                    D = { vim.lsp.buf.declaration, 'Goto Declaration', opts },
                },
            },

            d = {
                name = 'LSP Diagnostic',
                k = { vim.diagnostic.open_float, 'Open Float', opts },
                p = { vim.diagnostic.goto_prev, 'Goto Previous', opts },
                n = { vim.diagnostic.goto_next, 'Goto Next', opts },
            },
        }, { prefix = '<leader>' })

        -- pressing <leader>lk is sometimes a little too much work
        -- so C-k also works
        wk.register({
            ['<C-k>'] = { vim.lsp.buf.hover, 'LSP Hover', opts }
        })
    end
})

-- snippet expansion
-- not needed as it's integrated into nvim-cmp
-- thanks to cmp_luasnip
-- wk.register({
--     ['<C-l>'] = { luasnip.expand, 'Expand Snippet' },
-- }, { mode = {'i'} })
