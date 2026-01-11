" Name:       b-syntax.vim
" Mantainer:  Miu <https://github.com/miublue>
" Repository: https://github.com/miublue/b-syntax.vim
" License:    MIT
"
" Simple syntax highlighting for the B programming language.

if exists('b:current_syntax')
    finish
endif
syntax clear

let b:current_syntax = 'b'

syn keyword bKeyword auto case else extrn goto
                   \ if return switch while

syn match bWord '\<\h\w*\>'
syn match bLabel '^\s*\<\h\w*\>\(\s\|\n\)*:'

if get(g:, 'b_highlight_functions', 0)
    syn match bFunction '\<\h\w*\>\(\s\|\n\)*\ze('
endif

if get(g:, 'b_highlight_operators', 1)
    syn match bOperator '[><!=\|\&\?:\+\-\*\/%]'
endif

syn match bNumber '\d\+\(\.\d\+\)\?'
syn match bEscape "\*[*0etrn\'\"()]" contained
syn region bString start="\"" end="\"" contains=bEscape,@Spell
syn region bString start="\'" end="\'" contains=bEscape,@Spell
syn region bComment start="/\*" end="\*/"

if get(g:, 'b_extended_syntax', 0)
    syn region bComment start="//" end="$"
    syn match bNumber '0[xX]\(\x\+\)'
    syn match bNumber '0[bB]\([01]\+\)'
    syn match bEscape "\\[*0etrn\'\"()]" contained
endif

hi def link bKeyword Keyword
hi def link bFunction Function
hi def link bLabel Label
hi def link bNumber Number
hi def link bString String
hi def link bEscape Special
hi def link bOperator Operator
hi def link bComment Comment

