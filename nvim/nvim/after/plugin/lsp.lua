local lspconfig = require('lspconfig')
local cmp = require('cmp')
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
local luasnip = require('luasnip')

-- setup autocomplete
cmp.setup({
    snippet = {
        expand = function(args)
            -- vim.fn['vsnip#anonymous'](args.body) -- vsnip
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select_opts),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
            -- elseif luasnip.expandable() then
            --     luasnip.expand()
            -- elseif luasnip.expand_or_jumpable() then
            --     luasnip.expand_or_jump()
            elseif luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' })
    },
    sources = cmp.config.sources({
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
    }, {
        { name = 'path' }
    }),
    preselect = cmp.PreselectMode.Item, -- set to cmp.PreselectMode.None to disable preselect
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

require('isabelle-lsp').setup({})
lspconfig.isabelle.setup({
    capabilities = capabilities,
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
	s('\\Implies', { t('\\<Longrightarrow>'), }),
	s('\\implies', { t('\\<longrightarrow>'), }),
	s('\\To', { t('\\<Rightarrow>'), }),
	s('\\to', { t('\\<rightarrow>'), }),

	s('\\Longrightarrow', { t('\\<Longrightarrow>'), }),
	s('\\longrightarrow', { t('\\<longrightarrow>'), }),
	s('\\Rightarrow', { t('\\<Rightarrow>'), }),
	s('\\rightarrow', { t('\\<rightarrow>'), }),

	s('\\Iff', { t('\\<Longleftrightarrow>'), }),
	s('\\iff', { t('\\<longleftrightarrow>'), }),

	s('\\forall', { t('\\<forall>'), }),
	s('\\exists', { t('\\<exists>'), }),
	s('\\and', { t('\\<and>'), }),
	s('\\or', { t('\\<or>'), }),
	s('\\not', { t('\\<not>'), }),
	s('\\And', { t('\\<And>'), }),
	s('\\Or', { t('\\<Or>'), }),

	s('\\noteq', { t('\\<noteq>'), }),
	s('\\neq', { t('\\<noteq>'), }),
	s('\\le', { t('\\<le>'), }),
	s('\\ge', { t('\\<ge>'), }),

	s('\\open', { t('\\<open>'), }),
	s('\\close', { t('\\<close>'), }),
	s('\\lbrakk', { t('\\<lbrakk>'), }),
	s('\\rbrakk', { t('\\<rbrakk>'), }),

	s('\\Gamma', { t('\\<Gamma>'), }),
	s('\\tau', { t('\\<tau>'), }),
	s('\\turnstile', { t('\\<turnstile>'), }),

    s('\\sub', { t('\\<^sub>'), }),

    s('simp', { t('simp'), }),
    s('auto', { t('auto'), }),
    s('force', { t('force'), }),
    s('fastforce', { t('fastforce'), }),
    s('blast', { t('blast'), }),
    s('try0', { t('try0'), }),
    s('sledgehammer', { t('sledgehammer'), }),

    s('fun', {
        t('fun '),
        i(1, 'function_name'),
        t(' :: "'),
        i(2),
        t({'" where', '\t"'}),
        f(copy, 1),
        t(' '),
        i(3),
        t('"'),
    }),
    s('inductive', {
        t('inductive '),
        i(1, 'predicate_name'),
        t(' :: "'),
        i(2),
        t({'" where', '\t"'}),
        f(copy, 1),
        t(' '),
        i(3),
        t('"'),
    }),
    s('proof', {
        t('proof ('),
        i(1, 'induction'),
        t({')', '\t'}),
        i(2),
        t({'', 'qed'}),
    }),
})

