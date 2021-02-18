let g:lsc_trace_level = 'verbose'
let g:lsc_auto_map = {'defaults': v:true,
    \'NextReference': ',n',
    \'PreviousReference': ',p',
    \}

let g:lsc_server_commands = {}
function! s:registerServer(language, path)
    if executable(a:path)
        let g:lsc_server_commands[a:language] = a:path
    elseif filereadable(expand(a:path))
        let g:lsc_server_commands[a:language] = expand(a:path)
    endif
endfunction

call s:registerServer('python', 'pyls')
call s:registerServer('java', '~/src/java-language-server/dist/lang_server_mac.sh')

if executable('dart')
    Plug 'natebosch/vim-lsc-dart'
    let s:init = v:true
endif

if !empty(g:lsc_server_commands) || exists('s:init')
    autocmd CompleteDone * silent! pclose
endif
