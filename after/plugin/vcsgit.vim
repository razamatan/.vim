if exists(":VCSCommandGetOption")
   function! s:CreateVCSMapping(shortcut, expansion, display)
      let lhs = VCSCommandGetOption('VCSCommandMapPrefix', '<Leader>c') . a:shortcut
      if !hasmapto(a:expansion)
         try
            execute 'nmap <silent> <unique>' lhs a:expansion
         catch /^Vim(.*):E227:/
            if(&verbose != 0)
               echohl WarningMsg|echomsg 'VCSCommand:  mapping ''' . lhs . ''' already exists, refusing to overwrite.  The mapping for ' . a:display . ' will not be available.'|echohl None
            endif
         endtry
      endif
   endfunction

   " diff against HEAD or cached
   call s:CreateVCSMapping('dh', ':VCSDiff HEAD<CR>', 'git diff HEAD')
   call s:CreateVCSMapping('dc', ':VCSDiff --cached<CR>', 'git diff --cached')
endif
