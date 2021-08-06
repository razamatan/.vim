autocmd User ProjectionistDetect
      \ call projectionist#append(getcwd(),
      \ {
      \   "src/main/*.java": {
      \     "alternate": "src/test/{}Test.java",
      \     "type": "impl"
      \   },
      \   "src/test/*Test.java": {
      \     "alternate": "src/main/{}.java",
      \     "type": "test"
      \   }
      \ })
