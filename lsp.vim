let g:lsc_trace_level = 'verbose'

let g:lsc_server_commands = {}
if executable('pyls')
    let g:lsc_server_commands.python = 'pyls'
endif
if executable('dart_language_server')
    let g:lsc_server_commands.dart = 'dart_language_server'
    let g:lsc_server_commands.html = 'dart_language_server'
endif

if !empty(g:lsc_server_commands)
    let g:lsc_auto_map = {
        \'GoToDefinition': '<C-]>',
        \'FindReferences': 'gr',
        \'NextReference': ',n',
        \'PreviousReference': ',p',
        \'FindImplementations': 'gI',
        \'DocumentSymbol': 'go',
        \'WorkspaceSymbol': 'gS',
        \'FindCodeActions': 'ga',
        \'Rename': 'gR',
        \'ShowHover': 'v:true',
        \'Completion': 'completefunc',
        \}
    set omnifunc=lsc#complete#complete
    autocmd CompleteDone * silent! pclose
endif
