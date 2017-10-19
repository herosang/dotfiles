set nocompatible
filetype off

source ~/.vim/plugins.vim

" due to new regex being slower for ruby syntax highlighting, using older regex
" TODO: remove once ruby syntax file has been updated to be more efficient with new regex
set re=1

" vim-textobj-rubyblock settings
runtime macros/matchit.vim " required for plugin (NOTE: still works when disabled, not sure why)

"" General UI

" set terminal colour to 256 on terminals (often using tmux, doesn't appear as 256 colour term)
if !has('gui_running')
  set t_Co=256
endif

colorscheme xoria256

" search related options
set is
set hlsearch "highlight search results
set incsearch " match search while entering text
set number
syntax on

" Custon mappings
source ~/.vim/mappings.vim

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" allow buffers not visible in a window to stay alive as "hidden" buffers
set hidden

"" CtrlP config
source ~/.vim/ctrlp.vim

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

"" GUI configs
source ~/.vim/gui.vim

"" Airline configs
source ~/.vim/airline.vim

" config for custom FileType specific configuration
" augroup prevents files being sourced again (like header file protector ifdefs in c++)
augroup configgroup
    autocmd!

    " add jbuilder syntax highlighting
    autocmd BufNewFile,BufRead *.jbuilder set ft=ruby

    " include project tags (stored within .git/tags)
    "set tags=./.git/tags;$HOME
    
    " configure the global tags path depending on the OS
    "if has('win32')
      "let s:global_tags_path = 'C:/code/environment/tags/'
    "else
      "let s:global_tags_path = $HOME . '/.tags/'
    "end

    " AddTags to return all global tags for the defined language (ie loading
    " Java API tags or Ruby/Rails tags, etc)
    "autocmd FileType java let &l:tags= AddTags('java', s:global_tags_path)
    "autocmd FileType c let &l:tags= AddTags('c', s:global_tags_path)
    "autocmd FileType ruby let &l:tags= AddTags('ruby', s:global_tags_path)

    " NOTE: to match specific file types, use pattern *.rb (instead of current *)
    " update project (local directory) tags on file save
    autocmd BufWritePost * call CreateTags()
    " update project (local directory) tags on vim startup
    autocmd VimEnter * call CreateTags()

    autocmd FileType vim setlocal textwidth=0

    " TODO: resolve this to work correctly
    "autocmd VimResized * execute "<C-W> ="
augroup END

" folding options
" fold based on FileType specific syntax
set foldmethod=syntax
" visual fold column disabled, don't really find it useful
"set foldcolumn=0
" sets the default level of folds to begin folding syntactically
set foldlevel=2

"" ctags specific config
source ~/.vim/add_tags.vim

source ~/.vim/create_tags.vim

"" Vim JSX config
source ~/.vim/jsx.vim

"" Custom Functions

source ~/.vim/vertical_layout.vim

source ~/.vim/rhubarb.vim

source ~/.vim/fzf.vim

source ~/.vim/repeat_char.vim

source ~/.vim/my_diff.vim

" COMMANDS TO REMEMBER
" NOTE: you can swap between different selection modes (C-q, v, SHIFT-v) when already in selection
" NOTE: you can insert into both ends of block selection (or beginning of line selection) with either I or A after making selection
" NOTE: commands using i" or a" will jump automatically to the first occurance in the line and execute (ie ci" before the first occurance will jump to, and perform ci")
" NOTE: can make sentence selections using s, paragraphs using p
" <visual selection> then gq to format (insert <EOL>s) around newline wrapped tex
" <visual selection> then J to merge selected lines into one line
" <visual selection> then o to jump to beginning/end of selection

" :[line-to-move-range]m {line-to-insert-at} moves line to position (can use . for line under cursor) ie :1m. to move 1st line to current cursor position

" gU{motion}/gu{motion} to uppercase/lowercase (motions maching like w/i(/p/a{ etc)
" NOTE: can search through directories (recursively) with **/ search pattern
"     ie: :n **/*.rb to open all ruby files recursively from the current directory
" :vim[grep] can also use **/
" NOTE: to yank text from a buffer into the command area (ie when searching) use / CTRL-R <buffer letter>
