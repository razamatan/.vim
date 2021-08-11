autocmd User ProjectionistDetect
      \ let s:root = simplify(fnamemodify(finddir("src", g:projectionist_file.";"), ":p:h:h")) |
      \ if len(s:root) |
      \   call projectionist#append(s:root,
      \   {
      \     "src/main/*.java": {
      \       "alternate": "src/test/{}Test.java",
      \       "type": "impl"
      \     },
      \     "src/test/*Test.java": {
      \       "alternate": "src/main/{}.java",
      \       "type": "test"
      \     }
      \   }) |
      \ endif
