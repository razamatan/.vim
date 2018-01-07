let g:lsc_server_commands = {}
if executable('app')
    let g:lsc_server_commands.c = 'app'
    let g:lsc_server_commands.cpp = 'app'
    let g:lsc_server_commands.objc = 'app'
    let g:lsc_server_commands.objcpp = 'app'
endif
if executable('pyls')
    let g:lsc_server_commands.python = 'pyls'
endif
if executable('dart_language_server')
    let g:lsc_server_commands.dart = 'dart_language_server'
    let g:lsc_server_commands.html = 'dart_language_server'
endif

if !empty(g:lsc_server_commands)
    let g:lsc_auto_map = v:true
endif
