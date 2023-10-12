require('which-key').setup{}

require('telescope').load_extension('project')

require('toggleterm').setup{}

-- indentation guides
require('ibl').setup{ scope = { enabled = false } }

-- status line at the bottom
require('lualine').setup{}

-- gcc command
require('Comment').setup{}

require('nvim-autopairs').setup{}
