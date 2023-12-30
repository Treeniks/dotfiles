local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local mini_files = require('mini.files')
local neogit = require('neogit')

local harpoon = require('harpoon')

vim.g.mapleader = ' '

vim.keymap.set({ 'n', 'i' }, '<C-s>', vim.cmd.write, { desc = 'Save' })

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', '<leader>e', mini_files.open, { desc = 'Mini Files' })

-- Telescope Keybinds
vim.keymap.set('n', '<leader>tp', telescope.extensions.project.project, { desc = 'Telescope Project' })
vim.keymap.set('n', '<leader>tf', telescope_builtin.find_files, { desc = 'Telescope Files' })
vim.keymap.set('n', '<leader>tg', telescope_builtin.git_files, { desc = 'Telescope Git Files' })
vim.keymap.set('n', '<leader>ts', function() telescope_builtin.grep_string({ search = vim.fn.input('Grep > ') }) end,
    { desc = 'Telescope Grep Search' })
vim.keymap.set('n', '<leader>tb', telescope_builtin.buffers, { desc = 'Buffers' })

-- Harpoon Keybinds
vim.keymap.set('n', '<leader>hm', function() harpoon:list():append() end, { desc = 'Harpoon Mark' })
vim.keymap.set('n', '<leader>hf', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = 'Harpoon Quick Menu' })
vim.keymap.set({ 'n', 'i' }, '<C-a>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = 'Harpoon Quick Menu' })
vim.keymap.set({ 'n', 'i' }, '<C-z>', function() harpoon:list():select(1) end, { desc = 'Harpoon Select 1' })
vim.keymap.set({ 'n', 'i' }, '<C-x>', function() harpoon:list():select(2) end, { desc = 'Harpoon Select 2' })

vim.keymap.set('n', '<leader>cr', function() vim.cmd('CellularAutomaton make_it_rain') end, { desc = 'lol Rain' })
vim.keymap.set('n', '<leader>cg', function() vim.cmd('CellularAutomaton game_of_life') end, { desc = 'lol Game' })

vim.keymap.set('n', '<leader>mt', MiniMap.toggle, { desc = 'MiniMap Toggle' })

-- v for version control
vim.keymap.set('n', '<leader>v', neogit.open, { desc = 'Neogit' })
vim.keymap.set('n', '<leader>j', vim.cmd.tabnext, { desc = 'Tab Next' })
vim.keymap.set('n', '<leader>k', vim.cmd.tabprevious, { desc = 'Tab Previous' })
vim.keymap.set('n', '<leader>n', vim.cmd.tabnew, { desc = 'Tab New' })
vim.keymap.set('n', '<leader>q', vim.cmd.tabclose, { desc = 'Tab Close' })

-- toggleterm
vim.keymap.set({ 'n', 'i', 't' }, '<C-\\>', function() vim.cmd.ToggleTerm('direction=float') end,
    { desc = 'Open Floating Terminal' })
vim.keymap.set('n', '<leader>b', function() vim.cmd.ToggleTerm('direction=tab') end,
    { desc = 'Open Floating Terminal' })

-- Default Keybind to go into Normal Mode while in Terminal Mode is <C-\><C-n>
vim.keymap.set('t', '<C-]>', '<C-\\><C-n>', { desc = 'Exit Terminal Mode' })

-- lsp keybinds
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover, { desc = 'LSP Hover', buffer = event.buf })
        vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'LSP Format', buffer = event.buf })
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'LSP Rename', buffer = event.buf })
        vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'LSP Code Action', buffer = event.buf })
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'LSP Goto Definition', buffer = event.buf })
        vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { desc = 'LSP Goto Declaration', buffer = event.buf })

        vim.keymap.set('n', '<leader>dk', vim.diagnostic.open_float,
            { desc = 'Diagnostic Open Float', buffer = event.buf })
        vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev,
            { desc = 'Diagnostic Goto Previous', buffer = event.buf })
        vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Diagnostic Goto Next', buffer = event.buf })

        vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, { desc = 'LSP Hover', buffer = event.buf })
    end
})

local miniclue = require('mini.clue')
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<leader>' },
        { mode = 'x', keys = '<leader>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },

        -- text edit keys
        { mode = 'n', keys = 'c' },
        { mode = 'n', keys = 'd' },
        { mode = 'n', keys = 'y' },
    },

    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),

        -- would need to add a whole bunch of custom clues for defualt actions
        -- oof
        -- { mode = 'n', keys = 'cw', desc = 'Change Word' }
    },

    window = {
        delay = 100,
    },
})
