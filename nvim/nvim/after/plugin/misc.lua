require('which-key').setup({})

require('telescope').load_extension('project')

require('toggleterm').setup({})

-- indentation guides
require('ibl').setup({ scope = { enabled = false } })

-- status line at the bottom
require('lualine').setup({})

-- gcc command
require('Comment').setup({})

-- require('nvim-autopairs').setup({})

require('harpoon'):setup()

-- vimtex settings
vim.g.vimtex_syntax_conceal = {
    accents = 1,
    ligatures = 1,
    cites = 1,
    fancy = 1,
    spacing = 0,
    greek = 1,
    math_bounds = 1,
    math_delimiters = 1,
    math_fracs = 1,
    math_super_sub = 1,
    math_symbols = 1,
    sections = 1,
    styles = 1,
}
