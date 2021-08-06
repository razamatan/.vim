autocmd User ProjectionistDetect
      \ call projectionist#append(getcwd(),
      \ {
      \   "*.h": {
      \     "alternate": ["{}.c", "{}.cpp", "{}.cc"],
      \     "type": "header"
      \   },
      \   "*.c": {
      \     "alternate": ["{}_test.c", "{}.h"],
      \     "type": "impl"
      \   },
      \   "*_test.c": {
      \     "alternate": ["{}.h", "{}.c",],
      \     "type": "test"
      \   },
      \   "*.cpp": {
      \     "alternate": ["{}.h", "{}_test.cpp"],
      \     "type": "impl"
      \   },
      \   "*_test.cpp": {
      \     "alternate": ["{}.h", "{}.cpp",],
      \     "type": "test"
      \   },
      \   "*.cc": {
      \     "alternate": ["{}_test.cc", "{}.h"],
      \     "type": "impl"
      \   },
      \   "*_test.cc": {
      \     "alternate": ["{}.h", "{}.cc",],
      \     "type": "test"
      \   }
      \ })
