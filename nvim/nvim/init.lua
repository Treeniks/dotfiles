require('plugins')
require('remap')

local ft = require('Comment.ft')
ft.set('isabelle', { '(*%s*)', '(*%s*)' })

-- doesn't work for some reason
-- vim.g.filetype_typ = 'typst'
vim.filetype.add({
    extension = {
        typ = 'typst'
    }
})

-- Theme selection
-- vim.cmd.colorscheme('rose-pine-dawn')
-- vim.cmd.colorscheme('aura-dark')
vim.cmd.colorscheme('catppuccin-mocha')
-- vim.cmd.colorscheme('catppuccin-latte')
-- vim.cmd.colorscheme('iceberg')
-- vim.cmd.colorscheme('carbonfox')
-- vim.cmd.colorscheme('tokyonight-night')
-- vim.cmd.colorscheme('embark')
-- vim.cmd.colorscheme('monokai-pro')
-- vim.cmd.colorscheme('kanagawa-dragon')
-- vim.cmd.colorscheme('dracula_pro_van_helsing')
-- vim.cmd.colorscheme('oxocarbon')
-- vim.cmd.colorscheme('poimandres')
-- vim.cmd.colorscheme('neofusion')
--
-- vim.g.sonokai_style = 'andromeda'
-- vim.cmd.colorscheme('sonokai')
--
-- vim.g.material_theme_style = 'darker'
-- vim.cmd.colorscheme('material')
--
--
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })

-- Neovide settings
vim.g.neovide_theme = 'dark'
vim.g.neovide_transparency = 0.95
-- vim.g.transparency = 0.95
vim.opt.guifont = 'JetBrains Mono:h13'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- should be filetype specific
-- vim.opt.wrap = false

-- makes word wrap only wrap on spaces instead of in the middle of words
vim.opt.linebreak = true
-- and adds some visual to a wrapping
vim.opt.breakindent = true
vim.opt.breakindentopt = "sbr"
vim.opt.showbreak = " "

vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 1
vim.opt.signcolumn = 'yes' -- stops constant shifting because of LSP diagnostics

vim.opt.list = true
vim.opt.listchars:append({
    tab = '>-',
    trail = '⋅',
})
