vim.g.mapleader = " "

vim.keymap.set({'n', 'i'}, '<C-s>', vim.cmd.write)

-- lsp

-- nvim-tree
vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeFocus)

-- telescope
local telescope = require('telescope')
vim.keymap.set('n', '<leader>tp', telescope.extensions.project.project)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tf', builtin.find_files)
vim.keymap.set('n', '<leader>tg', builtin.git_files)
vim.keymap.set('n', '<leader>ts', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)

vim.keymap.set('n', '<leader>tb', builtin.buffers)

-- toogleterm
vim.keymap.set({'n', 't'}, '<C-\\>', function() vim.cmd.ToggleTerm('direction=float') end)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
