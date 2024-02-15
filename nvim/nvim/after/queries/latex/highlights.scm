; inherits: latex
; non-math
; those two don't seem to be their own query, fuck
; (((word) @Conceal (#eq? @Conceal "``")) (#set! conceal "“"))
; (((word) @Conceal (#eq? @Conceal "''")) (#set! conceal "”"))
(((command_name) @Conceal (#eq? @Conceal "\\\\")) (#set! conceal "⏎"))

; -----

; spacing
(((command_name) @Conceal (#eq? @Conceal "\\ ")) (#set! conceal " "))

(((command_name) @Conceal (#eq? @Conceal "\\ne")) (#set! conceal "≠"))
(((command_name) @Conceal (#eq? @Conceal "\\neq")) (#set! conceal "≠"))
(((command_name) @Conceal (#eq? @Conceal "\\noteq")) (#set! conceal "≠"))
(((command_name) @Conceal (#eq? @Conceal "\\le")) (#set! conceal "≤"))
(((command_name) @Conceal (#eq? @Conceal "\\leq")) (#set! conceal "≤"))
(((command_name) @Conceal (#eq? @Conceal "\\ge")) (#set! conceal "≥"))
(((command_name) @Conceal (#eq? @Conceal "\\geq")) (#set! conceal "≥"))

(((command_name) @Conceal (#eq? @Conceal "\\top")) (#set! conceal "⊤"))
(((command_name) @Conceal (#eq? @Conceal "\\bot")) (#set! conceal "⊥"))

(((command_name) @Conceal (#eq? @Conceal "\\Delta")) (#set! conceal "Δ"))
(((command_name) @Conceal (#eq? @Conceal "\\delta")) (#set! conceal "δ"))

(((command_name) @Conceal (#eq? @Conceal "\\square")) (#set! conceal "□"))
(((command_name) @Conceal (#eq? @Conceal "\\Box")) (#set! conceal "□"))

(((command_name) @Conceal (#eq? @Conceal "\\equiv")) (#set! conceal "≡"))
(((command_name) @Conceal (#eq? @Conceal "\\forall")) (#set! conceal "∀"))
(((command_name) @Conceal (#eq? @Conceal "\\ldotp")) (#set! conceal "."))
(((command_name) @Conceal (#eq? @Conceal "\\implies")) (#set! conceal "⇒"))
(((command_name) @Conceal (#eq? @Conceal "\\iff")) (#set! conceal "⇔"))
(((command_name) @Conceal (#eq? @Conceal "\\land")) (#set! conceal "∧"))
(((command_name) @Conceal (#eq? @Conceal "\\lor")) (#set! conceal "∨"))

(((command_name) @Conceal (#eq? @Conceal "\\empty")) (#set! conceal "Ø"))
(((command_name) @Conceal (#eq? @Conceal "\\emptyset")) (#set! conceal "Ø"))
(((command_name) @Conceal (#eq? @Conceal "\\subseteq")) (#set! conceal "⊆"))
(((command_name) @Conceal (#eq? @Conceal "\\supseteq")) (#set! conceal "⊇"))
(((command_name) @Conceal (#eq? @Conceal "\\in")) (#set! conceal "∈"))
(((command_name) @Conceal (#eq? @Conceal "\\notin")) (#set! conceal "∉"))
(((command_name) @Conceal (#eq? @Conceal "\\cup")) (#set! conceal "∪"))
(((command_name) @Conceal (#eq? @Conceal "\\cap")) (#set! conceal "∩"))
(((command_name) @Conceal (#eq? @Conceal "\\setminus")) (#set! conceal "⧵"))
(((command_name) @Conceal (#eq? @Conceal "\\bigcap")) (#set! conceal "∩"))
(((command_name) @Conceal (#eq? @Conceal "\\bigcup")) (#set! conceal "∪"))

(((command_name) @Conceal (#eq? @Conceal "\\sqsubseteq")) (#set! conceal "⊑"))
(((command_name) @Conceal (#eq? @Conceal "\\sqsupseteq")) (#set! conceal "⊒"))
(((command_name) @Conceal (#eq? @Conceal "\\sqcap")) (#set! conceal "⊓"))
(((command_name) @Conceal (#eq? @Conceal "\\sqcup")) (#set! conceal "⊔"))
(((command_name) @Conceal (#eq? @Conceal "\\Sqcap")) (#set! conceal "⩎"))
(((command_name) @Conceal (#eq? @Conceal "\\Sqcup")) (#set! conceal "⩏"))
(((command_name) @Conceal (#eq? @Conceal "\\bigsqcap")) (#set! conceal "⨅"))
(((command_name) @Conceal (#eq? @Conceal "\\bigsqcup")) (#set! conceal "⨆"))

(((command_name) @Conceal (#eq? @Conceal "\\llbracket")) (#set! conceal "⟦"))
(((command_name) @Conceal (#eq? @Conceal "\\rrbracket")) (#set! conceal "⟧"))

(((command_name) @Conceal (#eq? @Conceal "\\to")) (#set! conceal "→"))
(((command_name) @Conceal (#eq? @Conceal "\\mapsto")) (#set! conceal "↦"))

(((command_name) @Conceal (#eq? @Conceal "\\mid")) (#set! conceal "∣"))
(((command_name) @Conceal (#eq? @Conceal "\\dots")) (#set! conceal "…"))
(((command_name) @Conceal (#eq? @Conceal "\\sharp")) (#set! conceal "♯"))
(((command_name) @Conceal (#eq? @Conceal "\\circ")) (#set! conceal "∘"))
(((command_name) @Conceal (#eq? @Conceal "\\oplus")) (#set! conceal "⊕"))
(((command_name) @Conceal (#eq? @Conceal "\\coloneqq")) (#set! conceal "≔"))
(((command_name) @Conceal (#eq? @Conceal "\\infty")) (#set! conceal "∞"))

(((command_name) @Conceal (#eq? @Conceal "\\langle")) (#set! conceal "⟨"))
(((command_name) @Conceal (#eq? @Conceal "\\rangle")) (#set! conceal "⟩"))

; escaped characters
(((command_name) @Conceal (#eq? @Conceal "\\_")) (#set! conceal "_"))
(((command_name) @Conceal (#eq? @Conceal "\\{")) (#set! conceal "{"))
(((command_name) @Conceal (#eq? @Conceal "\\}")) (#set! conceal "}"))
(((command_name) @Conceal (#eq? @Conceal "\\&")) (#set! conceal "&"))

; mathbb letters
(((generic_command) @Conceal (#eq? @Conceal "\\mathbb{L}")) (#set! conceal "𝕃"))

; greek letters
(((command_name) @Conceal (#eq? @Conceal "\\pi")) (#set! conceal "π"))
(((command_name) @Conceal (#eq? @Conceal "\\gamma")) (#set! conceal "γ"))
(((command_name) @Conceal (#eq? @Conceal "\\rho")) (#set! conceal "ρ"))
(((command_name) @Conceal (#eq? @Conceal "\\mu")) (#set! conceal "μ"))

; subscripts
; copy over from isabelle plugin or
; https://github.com/lervag/vimtex/blob/9df79e15bf035d1cfb32c11fffed38dd7b6a0501/autoload/vimtex/syntax/core.vim#L1404
; we can copy a lot from there actually
(((subscript) @Conceal (#eq? @Conceal "_0")) (#set! conceal "₀"))
(((subscript) @Conceal (#eq? @Conceal "_1")) (#set! conceal "₁"))
(((subscript) @Conceal (#eq? @Conceal "_2")) (#set! conceal "₂"))
(((subscript) @Conceal (#eq? @Conceal "_3")) (#set! conceal "₃"))
(((subscript) @Conceal (#eq? @Conceal "_n")) (#set! conceal "ₙ"))

; superscripts
(((superscript) @Conceal (#eq? @Conceal "^1")) (#set! conceal "¹"))
(((superscript) @Conceal (#eq? @Conceal "^2")) (#set! conceal "²"))
(((superscript) @Conceal (#eq? @Conceal "^k")) (#set! conceal "ᵏ"))
(((superscript) @Conceal (#eq? @Conceal "^n")) (#set! conceal "ⁿ"))

; custom ones
(((command_name) @Conceal (#eq? @Conceal "\\D")) (#set! conceal "𝔻"))
(((command_name) @Conceal (#eq? @Conceal "\\R")) (#set! conceal "ℝ"))
(((command_name) @Conceal (#eq? @Conceal "\\I")) (#set! conceal "𝕀"))
(((command_name) @Conceal (#eq? @Conceal "\\V")) (#set! conceal "𝕍"))
(((command_name) @Conceal (#eq? @Conceal "\\Z")) (#set! conceal "ℤ"))

(((command_name) @Conceal (#eq? @Conceal "\\binDelta")) (#set! conceal "Δ"))
(((command_name) @Conceal (#eq? @Conceal "\\binsquare")) (#set! conceal "□"))
