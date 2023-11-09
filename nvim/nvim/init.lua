require('plugins')
require('remap')

vim.filetype.add({
    extension = {
        thy = 'isabelle',
    },
})

vim.cmd.colorscheme('rose-pine')
-- vim.cmd.colorscheme('aura-dark')
-- vim.cmd.colorscheme('catppuccin_mocha')
-- light theme
-- vim.cmd.colorscheme('catppuccin_latte')
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

-- Neovide settings
vim.g.neovide_theme = 'dark'

-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.0
vim.g.transparency = 0.95
-- only works on MacOS for now
vim.g.neovide_background_color = "#15141b" .. alpha()
vim.opt.guifont = 'JetBrains Mono:h18'

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
