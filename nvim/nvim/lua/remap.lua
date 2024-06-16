local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

local harpoon = require('harpoon')

vim.g.mapleader = ' '

vim.keymap.set({ 'n', 'i' }, '<C-s>', vim.cmd.write, { desc = 'Save' })

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')

vim.keymap.set({ 'n', 'v' }, '<C-d>', '10jzz')
vim.keymap.set({ 'n', 'v' }, '<C-u>', '10kzz')

vim.keymap.set({ 'n', 'v' }, '<C-f>', '10j')
vim.keymap.set({ 'n', 'v' }, '<C-b>', '10k')

vim.keymap.set('n', '<leader>e', function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end,
    { desc = 'Mini Files' })
-- useful when using Neovide
vim.keymap.set('n', '<leader>r', function() MiniFiles.open('~/Documents') end, { desc = 'Mini Files at HOME' })

local files_set_cwd = function(path)
    -- Works only if cursor is on the valid file system entry
    local cur_entry_path = MiniFiles.get_fs_entry().path
    local cur_directory = vim.fs.dirname(cur_entry_path)
    vim.fn.chdir(cur_directory)
end

vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
        vim.keymap.set('n', 'cd', files_set_cwd, { buffer = args.data.buf_id })
    end,
})

vim.keymap.set('n', '<leader>s', function() MiniStarter.open() end, { desc = 'Mini Starter' })

-- disable highlighting after a search
vim.keymap.set('n', '<leader>,', vim.cmd.nohlsearch, { desc = "Disable Search Highlights" })
vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)

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

        vim.keymap.set('n', '<leader>gr', telescope_builtin.lsp_references,
            { desc = 'LSP Find References (Telescope)', buffer = event.buf })
        -- vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references,
        --     { desc = 'LSP Find References', buffer = event.buf })

        vim.keymap.set('n', '<leader>dk', vim.diagnostic.open_float,
            { desc = 'Diagnostic Open Float', buffer = event.buf })
        vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev,
            { desc = 'Diagnostic Goto Previous', buffer = event.buf })
        vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Diagnostic Goto Next', buffer = event.buf })

        vim.keymap.set('n', '<leader>dh', function() vim.diagnostic.enable(false) end, { desc = 'Diagnostic Disable/Hide', buffer = event.buf })
        vim.keymap.set('n', '<leader>ds', function() vim.diagnostic.enable(true) end, { desc = 'Diagnostic Enable/Show', buffer = event.buf })

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

        { mode = 'n', keys = '<leader>l', desc = 'LSP' },
        { mode = 'n', keys = '<leader>g', desc = 'LSP Goto' },
        { mode = 'n', keys = '<leader>d', desc = 'LSP Diagnostic' },
        { mode = 'n', keys = '<leader>t', desc = 'Telescope' },
        { mode = 'n', keys = '<leader>h', desc = 'Harpoon' },
        { mode = 'n', keys = '<leader>m', desc = 'MiniMap' },
        { mode = 'n', keys = '<leader>c', desc = 'lol' },
        -- would need to add a whole bunch of custom clues for defualt actions
        -- oof
        -- { mode = 'n', keys = 'cw', desc = 'Change Word' }
    },

    window = {
        delay = 100,
    },
})
