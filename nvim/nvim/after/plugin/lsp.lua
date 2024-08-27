local lspconfig = require('lspconfig')
local luasnip = require('luasnip')

-- used for corn.nvim, which is disabled
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
-- )

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, { border = 'rounded' }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, { border = 'rounded' }
)

vim.diagnostic.config({
    float = { border = "rounded" },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- enable language servers
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
})

lspconfig.julials.setup({
    capabilities = capabilities,
})

lspconfig.zls.setup({
    capabilities = capabilities,
})

lspconfig.clangd.setup({
    capabilities = capabilities,
})

lspconfig.ocamllsp.setup({
    capabilities = capabilities,
})

lspconfig.nim_langserver.setup({
    capabilities = capabilities,
})

lspconfig.crystalline.setup({
    capabilities = capabilities,
})

lspconfig.sourcekit.setup({
    capabilities = capabilities,
})

lspconfig.lua_ls.setup({
    capabilities = capabilities,
})

lspconfig.metals.setup({
    capabilities = capabilities,
})

lspconfig.tsserver.setup({
    capabilities = capabilities,
})

lspconfig.gleam.setup({
    capabilities = capabilities,
})

-- for typst
lspconfig.tinymist.setup({
    capabilities = capabilities,
    settings = {
        exportPdf = "never",
        formatterMode = "typstyle",
    },
})

lspconfig.texlab.setup({
    capabilities = capabilities,
})

lspconfig.isabelle.setup({
    capabilities = capabilities,
})

lspconfig.ltex.setup({
    capabilities = capabilities,
    autostart = false,
    filetypes = {
        -- default
        'bib', 'gitcommit', 'markdown', 'org', 'plaintex', 'rst', 'rnoweb', 'tex', 'pandoc', 'quarto', 'rmd', 'context', 'html', 'xhtml', 'mail', 'text',

        -- extras
        'typst',
    },
    settings = {
        ltex = {
            language = 'en-US',
            -- additionalRules = {
            --     languageModel = '/home/suteki/Documents/ngram/'
            -- },
        },
    },
    on_attach = function(_, _)
        require('ltex_extra').setup({
            load_langs = { 'en-US' }
        })
    end,
})

local s = luasnip.snippet
local sn = luasnip.snippet_node
local isn = luasnip.indent_snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local r = luasnip.restore_node
local events = require('luasnip.util.events')
local ai = require('luasnip.nodes.absolute_indexer')
local extras = require('luasnip.extras')
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require('luasnip.extras.expand_conditions')
local postfix = require('luasnip.extras.postfix').postfix
local types = require('luasnip.util.types')
local parse = require('luasnip.util.parser').parse_snippet
local ms = luasnip.multi_snippet
local k = require('luasnip.nodes.key_indexer').new_key

local function copy(args)
    return args[1]
end

luasnip.add_snippets('isabelle', {
    -- ===== custom =====
    s('\\Implies', { t('⟹') }),
    s('\\implies', { t('⟶') }),
    s('\\To', { t('⇒') }),
    s('\\to', { t('→') }),
    s('\\Iff', { t('⟺') }),
    s('\\iff', { t('⟷') }),

    -- lattice shit
    s('\\glb', { t('⊓') }),
    s('\\Glb', { t('⨅') }),
    s('\\lub', { t('⊔') }),
    s('\\Lub', { t('⨆') }),

    s('\\meet', { t('⊓') }),
    s('\\Meet', { t('⨅') }),
    s('\\join', { t('⊔') }),
    s('\\Join', { t('⨆') }),

    s('\\tree', { t('⟨'), i(1), t('⟩') }),
    s('\\leaf', { t('⟨⟩') }),

    -- numbers
    s('\\sub', { t('\\<^sub>') }),
    s('\\bsub', { t('\\<^bsub>') }),
    s('\\esub', { t('\\<^esub>') }),

    s('\\sup', { t('\\<^sup>') }),
    s('\\bsup', { t('\\<^bsup>') }),
    s('\\esup', { t('\\<^esup>') }),

    -- isabelle keywords
    s('simp', { t('simp') }),
    s('auto', { t('auto') }),
    s('force', { t('force') }),
    s('fastforce', { t('fastforce') }),
    s('blast', { t('blast') }),
    s('try0', { t('try0') }),
    s('sledgehammer', { t('sledgehammer') }),

    s('\\comment', {
        t('― ‹'),
        i(1),
        t('›')
    }),

    s('fun', {
        t('fun '),
        i(1),
        t(' :: "'),
        i(2),
        t({ '" where', '\t"' }),
        f(copy, 1),
        t(' '),
        i(3, '_'),
        t(' = '),
        i(4, 'undefined'),
        t('"'),
    }),
    s('inductive', {
        t('inductive '),
        i(1),
        t(' :: "'),
        i(2),
        t({ '" where', '\t"' }),
        i(3),
        t('"'),
    }),
    s('proof', {
        t('proof ('),
        i(1, 'induction'),
        t({ ')', '\t' }),
        i(2),
        t({ '', 'qed' }),
    }),
})
