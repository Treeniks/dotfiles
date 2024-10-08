require('tree-sitter-just').setup({})

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        -- programming langs
        'c',
        'lua',
        'rust',
        'zig',

        -- errors on Windows
        -- 'ocaml',
        'haskell',

        'java',
        'scala',

        -- markup langs
        'markdown',
        'markdown_inline',
        'latex',
        'typst',

        -- bad langs
        'javascript',
        'typescript',
    },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,

        -- disable = { 'latex' },
    },

    textobjects = {
        select = {
            enable = true,

            lookahead = true,
            keymaps = {
                ['af'] = "@function.outer",
                ['if'] = "@function.inner",
                ['ac'] = "@class.outer",
                ['ic'] = "@class.inner",
            },
        },
    },
})

vim.filetype.add({
    extension = {
        c3 = "c3",
        c3i = "c3",
        c3t = "c3",
    },
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.c3 = {
    install_info = {
        url = "https://github.com/c3lang/tree-sitter-c3",
        files = {"src/parser.c", "src/scanner.c"},
        branch = "main",
    },
}

-- require('tree-sitter-isar')

require('treesitter-context').setup({
    -- this breaks quite often with Zig
    -- and is generally not all that useful I find
    enable = false,           -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20,     -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})
