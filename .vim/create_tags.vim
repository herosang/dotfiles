"" Create Tags Function

function s:JobHandler(job_id, data, event) dict
  if a:event == 'stdout'
    let str = self.shell.' stdout: '.join(a:data)
  elseif a:event == 'stderr'
    let str = self.shell.' stderr: '.join(a:data)
  else
    let str = self.shell.' finished executing'
  endif

  echom str
endfunction

let s:callbacks = {
\ 'on_stdout': function('s:JobHandler'),
\ 'on_stderr': function('s:JobHandler'),
\ 'on_exit': function('s:JobHandler')
\ }

" create ctags
" TODO: create ctags for BOTH project dir and global dirs (ie $HOME . '.tags/')
if !exists(':call CreateTags')
  function CreateTags()
    " set tag_name to project_directory.filetype.tags
    "let l:tag_name = split(getcwd(), '/')[-1] . '.tags'
    " generate ctags (relative to the directory they're being generated in, ie .git/)
    "silent execute "!ctags --tag-relative -R -f .git/tags &> /dev/null"
    call jobstart(['bash', '-c', 'if [ -f .git/tags.pid ]; then exit ;fi; echo $$ > .git/tags.pid && ctags -R --tag-relative --languages=ruby --exclude=.git --exclude=log -f .git/tags && rm .git/tags.pid'], extend({'shell': 'ctags generator'}, s:callbacks))
  endfunction
endif
