set nocompatible
filetype off

" VUNDLE SPECIFIC CONFIG
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" due to new regex being slower for ruby syntax highlighting, using older regex
" TODO: remove once ruby syntax file has been updated to be more efficient with new regex
set re=1

" Keep Plugin commands between vundle#begin/end.
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " vundle

Plugin 'scrooloose/nerdcommenter' " comment related inserts plugin

Plugin 'qpkorr/vim-bufkill' " bud/bd/bw without closing window plugin

Plugin 'jelera/vim-javascript-syntax' " javascript syntax enhancer

Plugin 'ctrlpvim/ctrlp.vim' " fuzzy file/buffer/mru/tag finder for vim

Plugin 'tpope/vim-unimpaired' " map [q ]q, etc to quickfix related iterations (and more)

Plugin 'kchmck/vim-coffee-script' " coffescript syntax highlighting

" gui focused plugins
if has('gui')
  Plugin 'bling/vim-airline' " airline for visual goodness

  Plugin 'bling/vim-bufferline' " bufferline for airline
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" TODO: Refactor Config specific logic into ~/.vim/bundle/<plugin>/after directories

"" General UI

" set terminal colour to 256 on terminals (often using tmux, doesn't appear as 256 colour term)
if !has('gui_running')
  set t_Co=256
endif

colorscheme xoria256

" set leader command in map, ie ',' substituded with <leader>
let mapleader=' '

" search related options
set is
set hlsearch "highlight search results
set incsearch " match search while entering text
set number
syntax on

"" Custom mappings
" replace normal j & k up/down lines with gj & gk up/down VISUAL lines
" this allows for iterating over lines that are wrapped visually, but still
" count as just 1 line
nnoremap j gj
nnoremap k gk

" iterate over bufers using gh and gl movement keys (gh/gl not used, rebound to j and k)
" noremap to allow breaking out of visual selection
" NOTE: unbinds existing gl functionality (although uncertain how useful it is)
noremap gl :bn<CR>
noremap gh :bp<CR>

" also map F7 and F8 to convenience iterating over buffers (
noremap <F7> :bp<CR>
noremap <F8> :bn<CR>

" map <Leader>f to "print working file"
nnoremap <Leader>f :echo expand('%:p')<CR>

" map return to mark of position of last insert
nnoremap '<space> '^

" map return to mark of (exact) position of last insert (exat row/col ` instead of exact row ' )
nnoremap <A-'><space> `^

" map <Leader>d to plugin bdelete WITHOUT closing window
nnoremap <Leader>d :BD<CR>

" set <Leader>space in normal mode to clear the search register
nnoremap <Leader><space> :let @/=""<CR>

" map <Leader>; to replace first character of every word on current line to uppercase
nmap <Leader>; :s/\w\+/\u&/g<CR>:let @/=""<CR>

" map <Leader> to p to open CtrlP in normal (file) mode
nnoremap <Leader>p :CtrlP<CR>

" map <Leader> to p to open CtrlP in buffer mode 
nnoremap <Leader>P :CtrlPBuffer<CR>

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" allow buffers not visible in a window to stay alive as "hidden" buffers
set hidden

"" Configure CtrlP
" enable the following plugins:
"   autoignore: read .ctrlpignore in project root directory (similar to .gitignore)
let g:ctrlp_extensions = ['autoignore']

" keep window position when returning to a hidden buffer (normally centres window on cursor)
" this includes BOTH centering around cursor position AND cursors position on a line
" grabbed from: (https://stackoverflow.com/questions/4251533/vim-keep-window-position-when-switching-buffers)
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufLeave * let b:cursorpos = getpos('.')
  au BufEnter * if(exists('b:winview'))   | call winrestview(b:winview)   | endif
  au BufEnter * if(exists('b:cursorpos')) | call setpos('.', b:cursorpos) | endif
endif

" TEXT MANIPULATION/INPUT OPTS
" TAB based input options
set tabstop=2 " how many spaces a <TAB> is read as by vim
set softtabstop=2 " how many spaces to insert when a <TAB> is pressed
set shiftwidth=2
set expandtab " always insert spaces instead of tabs

" cursorline disabled for now as it slows page drawing too greatly with ruby syntax
"set cursorline " display a line over cursor position

" wrap lines at a character that occurs at 'breakat' instead of last character on screen
set linebreak
" in wrap in check as exists in vim7.4.69+
" set text to match indent level when wrapping to the next line (does not insert <EOF>s)
if exists('+breakindent')
  set breakindent
endif


" visual changes/QoL changes
set showtabline=2
set laststatus=2
set wildmenu " display graphical auto-complete menu in command menu
set showmatch " once a closing bracket character is inserted, jump to other bracket briefly

" store swap files in temporary directory
if has('win32')
  set dir=$TEMP
else
  set dir=/tmp
endif

"" GUI specific options

if has('gui_running')
 
  " set initial size of window via number of lines and columns to be displayed (GUI mode)
  set lines=60
  set columns=100
  
  " Font Specific content
  set encoding=utf-8
  set guifont=Inconsolata-g\ for\ Powerline:h10

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

  "" Airline Configs
  " exists(':AirlineToggle')
  
  " set airline theme
  let g:airline_theme='papercolor'

  " airline specific font content
  let g:airline_powerline_fonts=1

  " set the airline symbols
  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''

  " airline-tabline options
  " enable tabline
  let g:airline#extensions#tabline#enabled = 1

  " show tab number beside buffer (and tabs?)
  "" let g:airline#extensions#tabline#show_tab_nr = 1

  let g:airline#extensions#tabline#show_buffers = 1

  " display all tabs instead of "..." when more tabs than window can be displayed
  " Currently disabled 
  let g:airline#extensions#tabline#show_tabs = 1

  "" let g:airline#extensions#tabline#exclude_preview = 0

  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

  " vim-bufferline options
  " enable bufferline
  let g:airline#extensions#bufferline#enabled = 1 

  let g:airline#extensions#bufferline#overwrite_variables = 1

  " airline-syntastic
  " let g:airline#extensions#syntastic#enabled = 1

endif 

" config for custom FileType specific configuration
" augroup prevents files being sourced again (like header file protector ifdefs in c++)
augroup configgroup
    autocmd!
    
    " AddTags to return all global 'java' tag files, assign them to tags variable
    " NOTE: local version of tags doesn't seem to work (or exist), opted to simply
    " overwrite instead of appending
    " TODO: generalize AddTags to be OS portable
    if has('win32')
      autocmd FileType java let &l:tags= AddTags('java')
      autocmd FileType c let &l:tags= AddTags('c')
    endif

    autocmd FileType vim setlocal textwidth=0

    autocmd FileType javascript call JavaScriptFold() " enable folding for javascript

    " use following to set tag directories for specific FileTypes
    " autocmd FileType java setlocal tags+=""
augroup END


" function loadTags()
"   for fileName in split(glob(), '\n')
" endfunction

" folding options
" fold based on FileType specific syntax
set foldmethod=syntax
" visual fold column disabled, don't really find it useful
"set foldcolumn=0
" sets the default level of folds to begin folding syntactically
set foldlevel=2

"" Tags Section
" TODO: Automatically generate ctags, append/remove/etc on file save

" set tags to include all tag files in the code/environment directory
" following line assigns all tags stored in code/environment to tagfiles variable
" NOTE: glob returns all files matched within the wildcard expression, delimited by '\n'
" NOTE: all '\n' found in the result of the glob function are replaced with ',' delims used by vim to delimit multiple file entries in the 'tags' vim option
"let tagfiles= substitute(glob('C:/code/environment/tags/*.tags'), "\n", ",", "g")

" sets the tags field to include all tag files added to the tagfiles expression
" NOTE: 'let &{option-name} .=' appends options to the result of let assignments, ie assign option to variable below (does NOT append ',' like set+= does), so appending first ',' manually
"let &tags.= ',' . tagfiles
" TODO: implement global tag loading on unix environments
if has('win32')
  if !exists('AddTags')
    function AddTags(filetype)
      let tagfiles= substitute(glob('C:/code/environment/tags/*.' . a:filetype . '.tags'), "\n", ",", "g")
      return tagfiles
    endfunction
  endif
endif

"" Custom Functions

" expand the window to twice the side and vertical split (GUI mode)
if has('gui_running')
  if !exists('VerticalLayout')
    command VLayout call VerticalLayout() 

    function VerticalLayout()
      let &columns += &columns " double size of window
      vertical botright split  
    endfunction
  endif
endif

" auto generated diff stuff (not sure what it does exactly)
if !exists('MyDiff')
set diffexpr=MyDiff()
  function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
      if &sh =~ '\<cmd'
        let cmd = '""' . $VIMRUNTIME . '\diff"'
        let eq = '"'
      else
        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
      endif
    else
      let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
  endfunction
endif

" insert(s)/append(S) a single character. Can be repeated <count>s
" NOTE: overwrites s and S commands, but can still be accessed with cl and cc respectively
" grabbed from: (http://vim.wikia.com/wiki/Insert_a_single_character)
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" COMMANDS TO REMEMBER
" NOTE: you can swap between different selection modes (C-q, v, SHIFT-v) when already in selection
" NOTE: you can insert into both ends of block selection (or beginning of line selection) with either I or A after making selection
" NOTE: commands using i" or a" will jump automatically to the first occurance in the line and execute (ie ci" before the first occurance will jump to, and perform ci")
" NOTE: can make word selections using s, paragraphs using p
" evisual selection> then gq to format (insert <EOL>s) around newline wrapped tex
" evisual selection> then J to merge selected lines into one line
" evisual selection> then o to jump to beginning/end of selection

" :[line-to-move-range]m {line-to-insert-at} moves line to position (can use . for line under cursor) ie :1m. to move 1st line to current cursor position

" gU{motion}/gu{motion} to uppercase/lowercase (motions maching like w/i(/p/a{ etc)
" NOTE: can search through directories (recursively) with **/ search pattern
"     ie: :n **/*.rb to open all ruby files recursively from the current directory
" :vim[grep] can also use **/
" NOTE: to yank text from a buffer into the command area (ie when searching) use / CTRL-R <buffer letter>

