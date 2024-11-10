vim.opt.smartindent = false

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldlevel = 99 -- open folds by default

return {
    'nvim-treesitter/nvim-treesitter',
    opts = {
        ensure_installed = {
            'lua', 'rust', 'c', 'cpp', 'zig',
            'typst', 'latex', 'markdown',
            'just'
        },

        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        indent = { enable = true },
    },
}
