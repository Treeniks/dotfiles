-- ===== Settings =====
-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- indents
vim.opt.tabstop = 4     -- overwritten for some filetypes

vim.opt.softtabstop = 0 -- 0 means "use tabstop"
vim.opt.shiftwidth = 0
vim.opt.expandtab = true

-- wordwrap settings
-- vim.opt.wrap = true/false -- filetype specific
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakindentopt = 'sbr'
vim.opt.showbreak = ' '

-- search
vim.opt.incsearch = true
vim.opt.ignorecase = true -- unsure

vim.opt.termguicolors = true

vim.opt.scrolloff = 1
vim.opt.signcolumn = 'number' -- or 'yes'

-- whitespace visuals
vim.opt.list = true
vim.opt.listchars:append({
    tab = '>-',
    trail = '⋅',
})

vim.o.undofile = true

-- ===== Neovide =====
vim.opt.guifont = 'Maple Mono:h13'
vim.g.neovide_theme = 'dark'
vim.g.neovide_transparency = 0.95

-- ===== Keybinds =====
-- plugin-related keybinds are set within each plugin's lua file
vim.g.mapleader = ' '

local kmset = vim.keymap.set

kmset({ 'n', 'i', 'v' }, '<C-s>', vim.cmd.write, { desc = 'Save' })

kmset('n', 'j', 'gj')
kmset('n', 'k', 'gk')
kmset('n', 'gj', 'j')
kmset('n', 'gk', 'k')

kmset('', '<C-d>', '10jzz')
kmset('', '<C-u>', '10kzz')
kmset('', '<C-f>', '10j')
kmset('', '<C-b>', '10k')

kmset('n', '<ESC>', vim.cmd.nohlsearch)

-- ==== lazy.nvim =====
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out,                            'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    defaults = {
        version = '*',
    },

    spec = { { import = 'plugins' } },

    change_detection = {
        enabled = true,
        notify = false,
    },
})
