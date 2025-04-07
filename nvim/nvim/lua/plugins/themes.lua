return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        branch = 'main',
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                -- looks stupid with neovide
                -- and causes some issues with signature/completions windows and such
                -- transparent_background = true,
                dim_inactive = {
                    enabled = true,
                },
                integrations = {
                    blink_cmp = true,
                    treesitter = true,
                    notify = true,
                    mini = { enabled = true },
                    indent_blankline = { enabled = true },
                    leap = true,
                    noice = true,
                    nvim_surround = true,
                    render_markdown = true,
                    snacks = { enabled = true },
                    telescope = { enabled = true },
                    which_key = true,
                },
            })

            vim.cmd.colorscheme('catppuccin-mocha')

            -- light theme for projectors
            -- vim.cmd.colorscheme('catppuccin-latte')
        end,
    },
}
