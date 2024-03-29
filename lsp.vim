let g:lsc_trace_level = 'verbose'
let g:lsc_auto_map = {'defaults': v:true,
    \'NextReference': ',n',
    \'PreviousReference': ',p',
    \}

let g:lsc_server_commands = {}
function! s:registerServer(language, path, ...)
    if executable(a:path)
        let g:lsc_server_commands[a:language] = join([a:path] + a:000)
    elseif filereadable(expand(a:path))
        let g:lsc_server_commands[a:language] = join([expand(a:path)] + a:000)
    endif
endfunction

if executable('clangd')
    let g:lsc_server_commands['cpp'] = {
        \'command': 'clangd --background-index',
        \'suppress_stderr': v:true,
        \}
    let g:lsc_server_commands['c'] = {
        \'command': 'clangd --background-index',
        \'suppress_stderr': v:true,
        \}
endif

call s:registerServer('rust', 'rust-analyzer')
" https://github.com/python-lsp/python-lsp-server
call s:registerServer('python', 'pylsp')
call s:registerServer('lua', 'lua-language-server')
" https://github.com/georgewfraser/java-language-server#vim-with-vim-lsc
call s:registerServer('java', '~/src/java-language-server/dist/lang_server_mac.sh')

if executable('dart')
    Plug 'natebosch/vim-lsc-dart'
    let s:init = v:true
endif

if executable('gopls')
    let g:lsc_server_commands['go'] = {
        \'command': 'gopls serve',
        \'log_level': -1,
        \'suppress_stderr': v:true,
        \}
endif

if !empty(g:lsc_server_commands) || exists('s:init')
    autocmd CompleteDone * silent! pclose
endif
