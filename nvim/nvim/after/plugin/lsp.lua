local lspconfig = require('lspconfig')
local luasnip = require('luasnip')

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

lspconfig.typst_lsp.setup({
    capabilities = capabilities,
    settings = {
        exportPdf = "never"
    },
})

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
    s('\\alpha', { t('α') }),
    s('\\beta', { t('β') }),
    s('\\gamma', { t('γ') }),
    s('\\delta', { t('δ') }),
    s('\\epsilon', { t('ε') }),
    s('\\zeta', { t('ζ') }),
    s('\\eta', { t('η') }),
    s('\\theta', { t('θ') }),
    s('\\iota', { t('ι') }),
    s('\\kappa', { t('κ') }),
    s('\\lambda', { t('λ') }),
    s('\\mu', { t('μ') }),
    s('\\nu', { t('ν') }),
    s('\\xi', { t('ξ') }),
    s('\\pi', { t('π') }),
    s('\\rho', { t('ρ') }),
    s('\\sigma', { t('σ') }),
    s('\\tau', { t('τ') }),
    s('\\upsilon', { t('υ') }),
    s('\\phi', { t('φ') }),
    s('\\chi', { t('χ') }),
    s('\\psi', { t('ψ') }),
    s('\\omega', { t('ω') }),
    s('\\Gamma', { t('Γ') }),
    s('\\Delta', { t('Δ') }),
    s('\\Theta', { t('Θ') }),
    s('\\Lambda', { t('Λ') }),
    s('\\Xi', { t('Ξ') }),
    s('\\Pi', { t('Π') }),
    s('\\Sigma', { t('Σ') }),
    s('\\Upsilon', { t('Υ') }),
    s('\\Phi', { t('Φ') }),
    s('\\Psi', { t('Ψ') }),
    s('\\Omega', { t('Ω') }),

    s('\\complex', { t('ℂ') }),
    s('\\rat', { t('ℚ') }),
    s('\\real', { t('ℝ') }),
    s('\\int', { t('ℤ') }),

    s('\\leftarrow', { t('←') }),
    s('\\longleftarrow', { t('⟵') }),
    s('\\longlongleftarrow', { t('⤎') }),
    s('\\longlonglongleftarrow', { t('⇠') }),
    s('\\rightarrow', { t('→') }),
    s('\\longrightarrow', { t('⟶') }),
    s('\\longlongrightarrow', { t('⤏') }),
    s('\\longlonglongrightarrow', { t('⇢') }),
    s('\\Leftarrow', { t('⇐') }),
    s('\\Longleftarrow', { t('⟸') }),
    s('\\Lleftarrow', { t('⇚') }),
    s('\\Rightarrow', { t('⇒') }),
    s('\\Longrightarrow', { t('⟹') }),
    s('\\Rrightarrow', { t('⇛') }),
    s('\\leftrightarrow', { t('↔') }),
    s('\\longleftrightarrow', { t('⟷') }),
    s('\\Leftrightarrow', { t('⇔') }),
    s('\\Longleftrightarrow', { t('⟺') }),
    s('\\mapsto', { t('↦') }),
    s('\\longmapsto', { t('⟼') }),
    s('\\midarrow', { t('─') }),
    s('\\Midarrow', { t('═') }),
    s('\\hookleftarrow', { t('↩') }),
    s('\\hookrightarrow', { t('↪') }),
    s('\\leftharpoondown', { t('↽') }),
    s('\\rightharpoondown', { t('⇁') }),
    s('\\leftharpoonup', { t('↼') }),
    s('\\rightharpoonup', { t('⇀') }),
    s('\\rightleftharpoons', { t('⇌') }),
    s('\\leadsto', { t('↝') }),
    s('\\downharpoonleft', { t('⇃') }),
    s('\\downharpoonright', { t('⇂') }),
    s('\\upharpoonleft', { t('↿') }),
    s('\\restriction', { t('↾') }),
    s('\\Colon', { t('∷') }),
    s('\\up', { t('↑') }),
    s('\\Up', { t('⇑') }),
    s('\\down', { t('↓') }),
    s('\\Down', { t('⇓') }),
    s('\\updown', { t('↕') }),
    s('\\Updown', { t('⇕') }),
    s('\\langle', { t('⟨') }),
    s('\\rangle', { t('⟩') }),
    s('\\llangle', { t('⟪') }),
    s('\\rrangle', { t('⟫') }),
    s('\\lceil', { t('⌈') }),
    s('\\rceil', { t('⌉') }),
    s('\\lfloor', { t('⌊') }),
    s('\\rfloor', { t('⌋') }),
    s('\\lparr', { t('⦇') }),
    s('\\rparr', { t('⦈') }),
    s('\\lbrakk', { t('⟦') }),
    s('\\rbrakk', { t('⟧') }),
    s('\\lbrace', { t('⦃') }),
    s('\\rbrace', { t('⦄') }),
    s('\\lblot', { t('⦉') }),
    s('\\rblot', { t('⦊') }),
    s('\\guillemotleft', { t('«') }),
    s('\\guillemotright', { t('»') }),
    s('\\bottom', { t('⊥') }),
    s('\\top', { t('⊤') }),
    s('\\and', { t('∧') }),
    s('\\And', { t('⋀') }),
    s('\\or', { t('∨') }),
    s('\\Or', { t('⋁') }),
    s('\\forall', { t('∀') }),
    s('\\exists', { t('∃') }),
    s('\\nexists', { t('∄') }),
    s('\\not', { t('¬') }),
    s('\\circle', { t('○') }),
    s('\\box', { t('□') }),
    s('\\diamond', { t('◇') }),
    s('\\diamondop', { t('⋄') }),
    s('\\turnstile', { t('⊢') }),
    s('\\Turnstile', { t('⊨') }),
    s('\\tturnstile', { t('⊩') }),
    s('\\TTurnstile', { t('⊫') }),
    s('\\stileturn', { t('⊣') }),
    s('\\surd', { t('√') }),
    s('\\le', { t('≤') }),
    s('\\ge', { t('≥') }),
    s('\\lless', { t('≪') }),
    s('\\ggreater', { t('≫') }),
    s('\\lesssim', { t('≲') }),
    s('\\greatersim', { t('≳') }),
    s('\\lessapprox', { t('⪅') }),
    s('\\greaterapprox', { t('⪆') }),
    s('\\in', { t('∈') }),
    s('\\notin', { t('∉') }),
    s('\\subset', { t('⊂') }),
    s('\\supset', { t('⊃') }),
    s('\\subseteq', { t('⊆') }),
    s('\\supseteq', { t('⊇') }),
    s('\\sqsubset', { t('⊏') }),
    s('\\sqsupset', { t('⊐') }),
    s('\\sqsubseteq', { t('⊑') }),
    s('\\sqsupseteq', { t('⊒') }),
    s('\\inter', { t('∩') }),
    s('\\Inter', { t('⋂') }),
    s('\\union', { t('∪') }),
    s('\\Union', { t('⋃') }),
    s('\\squnion', { t('⊔') }),
    s('\\Squnion', { t('⨆') }),
    s('\\sqinter', { t('⊓') }),
    s('\\Sqinter', { t('⨅') }),
    s('\\setminus', { t('∖') }),
    s('\\propto', { t('∝') }),
    s('\\uplus', { t('⊎') }),
    s('\\Uplus', { t('⨄') }),
    s('\\noteq', { t('≠') }),
    s('\\sim', { t('∼') }),
    s('\\doteq', { t('≐') }),
    s('\\simeq', { t('≃') }),
    s('\\approx', { t('≈') }),
    s('\\asymp', { t('≍') }),
    s('\\cong', { t('≅') }),
    s('\\smile', { t('⌣') }),
    s('\\equiv', { t('≡') }),
    s('\\frown', { t('⌢') }),
    s('\\Join', { t('⋈') }),
    s('\\bowtie', { t('⨝') }),
    s('\\prec', { t('≺') }),
    s('\\succ', { t('≻') }),
    s('\\preceq', { t('≼') }),
    s('\\succeq', { t('≽') }),
    s('\\parallel', { t('∥') }),
    s('\\Parallel', { t('‖') }),
    s('\\interleave', { t('⫴') }),
    s('\\sslash', { t('⫽') }),
    s('\\bar', { t('¦') }),
    s('\\bbar', { t('⫿') }),
    s('\\plusminus', { t('±') }),
    s('\\minusplus', { t('∓') }),
    s('\\times', { t('×') }),
    s('\\div', { t('÷') }),
    s('\\cdot', { t('⋅') }),
    s('\\star', { t('⋆') }),
    s('\\bullet', { t('∙') }),
    s('\\circ', { t('∘') }),
    s('\\dagger', { t('†') }),
    s('\\ddagger', { t('‡') }),
    s('\\lhd', { t('⊲') }),
    s('\\rhd', { t('⊳') }),
    s('\\unlhd', { t('⊴') }),
    s('\\unrhd', { t('⊵') }),
    s('\\triangleleft', { t('◃') }),
    s('\\triangleright', { t('▹') }),
    s('\\triangle', { t('△') }),
    s('\\triangleq', { t('≜') }),
    s('\\oplus', { t('⊕') }),
    s('\\Oplus', { t('⨁') }),
    s('\\otimes', { t('⊗') }),
    s('\\Otimes', { t('⨂') }),
    s('\\odot', { t('⊙') }),
    s('\\Odot', { t('⨀') }),
    s('\\ominus', { t('⊖') }),
    s('\\oslash', { t('⊘') }),
    s('\\dots', { t('…') }),
    s('\\cdots', { t('⋯') }),
    s('\\Sum', { t('∑') }),
    s('\\Prod', { t('∏') }),
    s('\\Coprod', { t('∐') }),
    s('\\infinity', { t('∞') }),
    s('\\integral', { t('∫') }),
    s('\\ointegral', { t('∮') }),
    s('\\clubsuit', { t('♣') }),
    s('\\diamondsuit', { t('♢') }),
    s('\\heartsuit', { t('♡') }),
    s('\\spadesuit', { t('♠') }),
    s('\\aleph', { t('ℵ') }),
    s('\\emptyset', { t('∅') }),
    s('\\nabla', { t('∇') }),
    s('\\partial', { t('∂') }),
    s('\\flat', { t('♭') }),
    s('\\natural', { t('♮') }),
    s('\\sharp', { t('♯') }),
    s('\\angle', { t('∠') }),
    s('\\copyright', { t('©') }),
    s('\\registered', { t('®') }),
    s('\\hyphen', { t('‐') }),
    s('\\inverse', { t('¯') }),
    s('\\sqdot', { t('·') }),
    s('\\onequarter', { t('¼') }),
    s('\\onehalf', { t('½') }),
    s('\\threequarters', { t('¾') }),
    s('\\ordfeminine', { t('ª') }),
    s('\\ordmasculine', { t('º') }),
    s('\\section', { t('§') }),
    s('\\paragraph', { t('¶') }),
    s('\\exclamdown', { t('¡') }),
    s('\\questiondown', { t('¿') }),
    s('\\euro', { t('€') }),
    s('\\pounds', { t('£') }),
    s('\\yen', { t('¥') }),
    s('\\cent', { t('¢') }),
    s('\\currency', { t('¤') }),
    s('\\degree', { t('°') }),
    s('\\amalg', { t('⨿') }),
    s('\\mho', { t('℧') }),
    s('\\lozenge', { t('◊') }),
    s('\\wp', { t('℘') }),
    s('\\wrong', { t('≀') }),
    s('\\acute', { t('´') }),
    s('\\index', { t('ı') }),
    s('\\dieresis', { t('¨') }),
    s('\\cedilla', { t('¸') }),
    s('\\hungarumlaut', { t('˝') }),
    s('\\bind', { t('⤜') }),
    s('\\then', { t('⪢') }),
    s('\\some', { t('ϵ') }),

    s('\\hole', { t('⌑') }),
    s('\\newline', { t('⏎') }),
    -- s('\\comment', { t('―') }),
    s('\\cancel', { t('⌦') }),
    s('\\marker', { t('✐') }),
    s('\\checkmark', { t('✓') }),
    s('\\crossmark', { t('✗') }),
    s('\\open', { t('‹') }),
    s('\\close', { t('›') }),
    s('\\here', { t('⌂') }),
    s('\\undefined', { t('❖') }),
    s('\\noindent', { t('⇤') }),
    s('\\smallskip', { t('┈') }),
    s('\\medskip', { t('┉') }),
    s('\\bigskip', { t('━') }),
    s('\\item', { t('▪') }),
    s('\\enum', { t('▸') }),
    s('\\descr', { t('➧') }),
    s('\\footnote', { t('⁋') }),
    s('\\verbatim', { t('▩') }),
    s('\\theory_text', { t('⬚') }),
    s('\\emph', { t('∗') }),
    s('\\bold', { t('❙') }),
    s('\\sub', { t('⇩') }),
    s('\\sup', { t('⇧') }),
    s('\\bsub', { t('⇘') }),
    s('\\esub', { t('⇙') }),
    s('\\bsup', { t('⇗') }),
    s('\\esup', { t('⇖') }),
    s('\\file', { t('🗏') }),
    s('\\dir', { t('🗀') }),
    s('\\url', { t('🌐') }),
    s('\\doc', { t('📓') }),
    s('\\action', { t('☛') }),

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
