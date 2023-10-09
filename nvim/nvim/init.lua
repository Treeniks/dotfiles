require('remap')
require('plugins')

vim.cmd.colorscheme('rose-pine')
-- vim.cmd.colorscheme('catppuccin_latte')
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.g.neovide_transparency = 0.95
vim.opt.guifont = 'JetBrains Mono:h16'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4
vim.opt.signcolumn = 'yes' -- stops constant shifting because of LSP diagnostics
