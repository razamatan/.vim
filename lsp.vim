let g:lsc_trace_level = 'verbose'
let g:lsc_auto_map = {'defaults': v:true,
    \'NextReference': ',n',
    \'PreviousReference': ',p',
    \}

let g:lsc_server_commands = {}
if executable('pyls')
    let g:lsc_server_commands.python = 'pyls'
endif

if executable('dart')
    Plug 'natebosch/vim-lsc-dart'
    let s:init = v:true
endif

if !empty(g:lsc_server_commands) || exists('s:init')
    autocmd CompleteDone * silent! pclose
endif
