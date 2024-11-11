return {
    -- trying out mini.surround for now
    -- but might revert as that one overwrites the 's' substitute command
    -- { 'kylechui/nvim-surround', version = '*', opts = {} }

    {
        'nvim-lualine/lualine.nvim',
        opts = {},
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        config = function()
            local render_markdown = require('render-markdown')
            local wk = require('which-key')

            render_markdown.setup({})
            wk.add({ '<leader>mm', render_markdown.toggle, desc = 'Render Markdown Toggle' })
        end,
    },

    {
        'Eandrju/cellular-automaton.nvim',
        config = function()
            require('which-key').add({
                { '<leader>c',  group = 'lol' },
                { '<leader>cr', function() vim.cmd('CellularAutomaton make_it_rain') end, desc = 'Rain' },
                { '<leader>cg', function() vim.cmd('CellularAutomaton game_of_life') end, desc = 'Game' },
            })
        end,
    },
}
