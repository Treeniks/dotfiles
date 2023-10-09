local wk = require('which-key')
local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.g.mapleader = " "

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

    -- Telescope keybinds
    t = {
        name = 'Telescope',
        p = { telescope.extensions.project.project, 'Project' },
        f = { builtin.find_files, 'Files' },
        g = { builtin.git_files, 'Git Files' },
        s = {
            function() builtin.grep_string({ search = vim.fn.input('Grep > ') }) end,
            'Grep Search',
        },
        b = { builtin.buffers, 'Buffers' },
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
                name = 'LSP',
                k = { vim.lsp.buf.hover, 'Hover', opts },
                f = { vim.lsp.buf.format, 'Format', opts },
                r = { vim.lsp.buf.rename, 'Rename', opts },
                a = { vim.lsp.buf.code_action, 'Code Action', opts },
            },

            d = {
                name = 'LSP Diagnostic',
                k = { vim.diagnostic.open_float, 'Open Float', opts },
                p = { vim.diagnostic.goto_prev, 'Goto Previous', opts },
                n = { vim.diagnostic.goto_next, 'Goto Next', opts },
            },
        }, { prefix = '<leader>' })
    end
})
