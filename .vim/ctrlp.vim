"" Configure CtrlP

" read unlimited files in project (due to large Rails projects)
let g:ctrlp_max_files = 0

" NOTE: currently disabled: use ctrlp-cmatcher for more efficient matching
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" use ag (the silver searcher) if it's provided on the machine
if executable('ag')
  " replace grep with ag
  set grepprg=ag\ --nogroup\ --nocolor

  " implement ag (the silver searcher) to match files (much faster)
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " no need for caching with ag
  let g:ctrlp_use_caching = 0
endif

" enable the following plugins:
"   autoignore: read .ctrlpignore in project root directory (similar to .gitignore)
"   tag:        enable `CtrlPTag` to search on tags
let g:ctrlp_extensions = ['tag']

