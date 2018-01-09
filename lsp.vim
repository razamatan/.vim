let g:lsc_trace_level = 'verbose'

let g:lsc_server_commands = {}
if executable('cquery')
    let cpp_config = {
                \'command': 'cquery --language-server --log-file=/tmp/cquery.log',
                \'initialization_options': {'cacheDirectory': '/tmp/cquery'},
                \}
    let g:lsc_server_commands.c = cpp_config
    let g:lsc_server_commands.cpp = cpp_config
    let g:lsc_server_commands.objc = cpp_config
    let g:lsc_server_commands.objcpp = cpp_config
endif
if executable('pyls')
    let g:lsc_server_commands.python = 'pyls'
endif
if executable('dart_language_server')
    let g:lsc_server_commands.dart = 'dart_language_server'
    let g:lsc_server_commands.html = 'dart_language_server'
endif

let g:lsc_auto_map = !empty(g:lsc_server_commands)
