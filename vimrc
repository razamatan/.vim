" the leader character is \
source ~/.vim/bundles.vim

syntax on               " pretty colors

set enc=utf-8           " utf-8
set expandtab           " i don't like tabs
set tabstop=2           " how to handle tabs
set shiftwidth=2
set noautoindent        " but not too much...

set ruler               " see where i'm @
set laststatus=2        " always show status line
set scrolloff=3         " always show lines around cursor
set showcmd             " show what command i'm doing
set list listchars=tab:»·,trail:·,nbsp:·

if (v:version > 703 || (v:version == 703 && has('patch541')))
  set formatoptions+=j    " allow removal of comment chars on J
endif
set cpoptions+=$        " 'c' & 's' functionality
set hidden              " no write on buffer switch

set wildmode=longest,full  " filename completion
set wildmenu               " filename completion
set hlsearch               " highlight search matches
set incsearch              " incremental search
set ic scs                 " case-insentive, smart case search
set modeline
set modelines=5
set nobackup

" completion
if has('python') && (v:version > 703 || (v:version == 703 && has('patch584')))
  " we're more than likely using ycm
  let g:ycm_autoclose_preview_window_after_insertion = 1
endif
if filereadable(expand('~/.vim/bundle/supertab/plugin/supertab.vim'))
  set completeopt=menuone,longest
  let g:SuperTabDefaultCompletionType = 'context'
endif

set shell=/bin/bash
set grepprg=grep\ -nH\ $*
set tags=tags;/

" colors
set background=dark
if $COLORTERM == "gnome-terminal"
  set t_Co=256
endif
exe "let g:solarized_termcolors=".&t_Co
let g:solarized_termtrans=1
colorscheme solarized
"hi StatusLine cterm=reverse
"hi StatusLineNC cterm=reverse ctermfg=DarkGrey
"hi Search ctermfg=White ctermbg=DarkBlue

" In normal mode, we use : much more often than ; so lets swap them.
" WARNING: this will cause any "ordinary" map command without the "nore" prefix
" that uses ":" to fail. For instance, "map <f2> :w" would fail, since vim will
" read ":w" as ";w" because of the below remappings. Use "noremap"s in such
" situations and you'll be fine.
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" window movement
nnoremap <C-Up> :wincmd k<CR>
nnoremap <C-Down> :wincmd j<CR>
nnoremap <C-Right> :wincmd l<CR>
nnoremap <C-Left> :wincmd h<CR>

" buffer movement
nnoremap <C-P> :bp<CR>
nnoremap <C-N> :bn<CR>

" line indenting
set cinkeys-=0#         " prevent # from autoflushing left
"set t_kB=[Z           " hit ctrl-v and S-Tab
inoremap <S-Tab> <C-O><LT><LT>
nnoremap <Tab> >>
nnoremap <S-Tab> <LT><LT>
vnoremap <Tab> >
vnoremap <S-Tab> <LT>
map -- gg=G''

" function keys
" <F5> buffer selection (switch)
"nnoremap <F5> :ls<CR>:e #
" <F8> spellchecking
if has("spell")
  set spelllang=en_us
  nnoremap <F8> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
else
  nnoremap <F8> <Bar>:echo "Spell Check Unavailable"<CR>
endif
" <F9> pastetoggle
set pastetoggle=<F9>
" <F12> gqap (cluster & autowrap)
nnoremap <F12> gqap

" macros
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
nnoremap <Leader>date :r!date<CR>
nnoremap <Leader>tag  :!tagup<CR>
nnoremap <Leader>make :w<CR>:!makeup<CR>

" functions
function! AppendModeline()
  let l:save_cursor = getpos('.')
  let l:append = ' vim: set ts='.&tabstop.' sw='.&shiftwidth.':'
  $put =substitute(&commentstring, '%s', l:append, '')
  call setpos('.', l:save_cursor)
endfunction

" misc autocmds
au Filetype mail set tw=0

" plugin related
nnoremap U :GundoToggle<CR>
nnoremap <Leader>of :FSHere<CR>
nnoremap <Leader>oF :FSSplitRight<CR>
let g:ctrlp_map = 'p'       " make ctrl-p alt-p
let g:ctrlp_max_files = 0     " go big
let g:ctrlp_max_depth = 40    " or go home
let bexec_rehighlight=1
let python_highlight_all=1
let g:netrw_liststyle=3       " tree
"let g:netrw_browse_split=4    " 0 same window, 1 horiz, 2 vert, 3 new tab, 4 previous window
"let g:netrw_preview=1         " 0 horizontal split, 1 vertical split

" latex stuff
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_ViewRule_pdf = 'xpdf'
let g:Tex_ViewRule_dvi = 'xdvi'
" (ctrl-space) for those <++>
imap <Nul> <Plug>IMAP_JumpForward
nmap <Nul> <Plug>IMAP_JumpForward

" last position jump
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" vimdiff
if &diff
  nnoremap <C-P> [cz.
  nnoremap <C-N> ]cz.
  nnoremap <C-L>u :diffupdate<CR><C-L>
  nnoremap Q :qa<CR>
endif

" platform specific overrides
let osvimrc = expand('~/.vim/os/'.substitute(system("uname"), "\n", "", ""))
if filereadable(osvimrc)
  exe "source ".osvimrc
endif

" host based overrides
if filereadable( expand("~/.dotfiles.$THIS_DOMAIN/vimrc") )
  source ~/.dotfiles.$THIS_DOMAIN/vimrc
endif
if filereadable( expand("~/.vim/host/$THIS_DOMAIN") )
  source ~/.vim/host/$THIS_DOMAIN
endif
if filereadable( expand("~/.vim/host/$THIS_HOST") )
  source ~/.vim/host/$THIS_HOST
endif
