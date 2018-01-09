" just want vim goodness
set nocompatible

" vim-plug goodness
call plug#begin('~/.vim/bundle')
" solarized color scheme
Plug 'altercation/vim-colors-solarized'
" search and highlight multiple terms
Plug 'vim-scripts/multisearch.vim'
" gundo (undo tree)
Plug 'sjl/gundo.vim'
" recovery
Plug 'chrisbra/Recover.vim'
" most recently used files
Plug 'vim-scripts/mru.vim'
" ctrl-p, fuzzy file open
Plug 'ctrlpvim/ctrlp.vim'
" vcs integration
Plug 'git://repo.or.cz/vcscommand.git'
" auto ts and sw
Plug 'tpope/vim-sleuth'

" more powerful . command
Plug 'tpope/vim-repeat'
" more powerful % command
Plug 'vim-scripts/matchit.zip'
" html/xml mappings, enhances vim-surround
Plug 'tpope/vim-ragtag'
" modify surrounding syntax
Plug 'tpope/vim-surround'

" check syntax of scripts
Plug 'vim-scripts/checksyntax-B'
" buffer execution
Plug 'vim-scripts/Bexec'
" align statements
Plug 'vim-scripts/Align'

" enhanced python
Plug 'vim-scripts/python.vim--Vasiliev'
" extend % for python
Plug 'vim-scripts/python_match.vim'
" pydoc integration
Plug 'fs111/pydoc.vim'
" jinja
Plug 'mitsuhiko/vim-jinja'

" latex
Plug 'vim-latex/vim-latex'
" elixir
Plug 'elixir-lang/vim-elixir'
" lisp
Plug 'kovisoft/slimv'
" dart
Plug 'dart-lang/dart-vim-plugin'
" json
Plug 'elzr/vim-json'
" alternate .h/.c
Plug 'derekwyatt/vim-fswitch'

" completion
"Plug 'vim-scripts/cscope_macros.vim'
if v:version >= 800
    Plug 'natebosch/vim-lsc'
    source ~/.vim/lsp.vim
endif
Plug 'ervandew/supertab'

call plug#end()
