require('plugins')
require('remap')

local ft = require('Comment.ft')
ft.set('isabelle', {'(*%s*)', '(*%s*)'})

-- Theme selection
-- vim.cmd.colorscheme('rose-pine')
-- vim.cmd.colorscheme('aura-dark')
-- vim.cmd.colorscheme('catppuccin_mocha')
-- vim.cmd.colorscheme('iceberg')
-- vim.cmd.colorscheme('carbonfox')
vim.cmd.colorscheme('tokyonight-moon')
-- vim.cmd.colorscheme('embark')
-- vim.cmd.colorscheme('monokai-pro')
--
-- vim.g.sonokai_style = 'andromeda'
-- vim.cmd.colorscheme('sonokai')
--
-- vim.g.material_theme_style = 'darker'
-- vim.cmd.colorscheme('material')
--
-- light theme
-- vim.cmd.colorscheme('catppuccin_latte')
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })

-- Neovide settings
vim.g.neovide_theme = 'dark'
vim.g.neovide_transparency = 0.95
-- vim.g.transparency = 0.95
vim.opt.guifont = 'JetBrains Mono:h16'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- should be filetype specific
-- vim.opt.wrap = false

vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 1
vim.opt.signcolumn = 'yes' -- stops constant shifting because of LSP diagnostics

vim.opt.list = true
vim.opt.listchars = {
    trail = "⋅",
}
