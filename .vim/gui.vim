"" GUI specific options

if has('gui_running')
 
  " set initial size of window via number of lines and columns to be displayed (GUI mode)
  set lines=60
  set columns=100

  " visual & modeless audoselect
  set guioptions +=a
  " remove GUI menu (m)
  set guioptions -=m
  "right & left-hand scrollbar (rl) (& when vertical split RL)
  set guioptions -=r
  set guioptions -=l
  set guioptions -=R
  set guioptions -=L
  " toolbar (T)
  set guioptions -=T
endif

" Font Specific content
set encoding=utf-8

" ignore if nvim (since it technically doesn't support guifont)
" terminal based nvim sessions instead use terminal to set font (ie set font in iTerm2)
if !has('nvim')
  set guifont=Inconsolata-g\ for\ Powerline:h12
endif

