" just want vim goodness
set nocompatible

" vim-plug goodness
call plug#begin('~/.vim/bundle')
" solarized color scheme
Plug 'altercation/vim-colors-solarized'
" :Dispatch, Start, Make, Copen !
Plug 'tpope/vim-dispatch'
" search and highlight multiple terms
"Plug 'inkarkat/vim-mark'
" more powerful undo
Plug 'mbbill/undotree'
" recovery
Plug 'chrisbra/Recover.vim'
" most recently used files (replaced by ctrlp)
"Plug 'yegappan/mru.vim'
" ctrl-p, fuzzy file open
Plug 'ctrlpvim/ctrlp.vim'
" vcs integration
Plug 'git://repo.or.cz/vcscommand.git'
" auto ts and sw
Plug 'tpope/vim-sleuth'
" ctrl-a/x for dates and times
Plug 'tpope/vim-speeddating'
" projectionist project management
Plug 'tpope/vim-projectionist'

" more powerful . command
Plug 'tpope/vim-repeat'
" more powerful % command
Plug 'chrisbra/matchit'
" html/xml mappings, enhances vim-surround
Plug 'tpope/vim-ragtag'
" modify surrounding syntax
Plug 'tpope/vim-surround'

" check syntax of scripts
Plug 'tomtom/checksyntax_vim'
" buffer execution
Plug 'fboender/bexec'
" align statements
Plug 'vim-scripts/Align'

" enhanced python
"Plug 'vim-scripts/python.vim--Vasiliev'
" pydoc integration
"Plug 'fs111/pydoc.vim'
" extend % for python
Plug 'vim-scripts/python_match.vim', { 'for': 'python' }
" jinja
Plug 'mitsuhiko/vim-jinja'
" latex
Plug 'vim-latex/vim-latex'
" elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
" lisp
Plug 'kovisoft/slimv', { 'for': 'lisp' }
" dart
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" json
Plug 'elzr/vim-json', { 'for': 'json' }
" terraform
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

" completion
"Plug 'vim-scripts/cscope_macros.vim'
if v:version >= 800
    Plug 'natebosch/vim-lsc'
    source ~/.vim/lsp.vim
endif
Plug 'ervandew/supertab'

call plug#end()
