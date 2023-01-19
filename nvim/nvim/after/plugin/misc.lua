require('nvim-tree').setup{}
vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle)

require('which-key').setup{}

require('project_nvim').setup{}

require('toggleterm').setup{}
vim.keymap.set({'n', 't'}, '<C-\\>', function() vim.cmd.ToggleTerm('direction=float') end)

-- not actually that helpful and more annoying
require('indent_blankline').setup{
    show_current_context = true,
    show_current_context_start = true
}

require('lualine').setup{}

require('Comment').setup{}

require('nvim-autopairs').setup{}

