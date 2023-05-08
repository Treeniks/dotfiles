require('nvim-tree').setup{}

require('which-key').setup{}

require('telescope').load_extension('project')

require('toggleterm').setup{}

-- indentation guides
require('indent_blankline').setup{
    show_current_context = true,
    show_current_context_start = true
}

-- status line at the bottom
require('lualine').setup{}

-- gcc command
require('Comment').setup{}

require('nvim-autopairs').setup{}
