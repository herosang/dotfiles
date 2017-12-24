" Vundle Configs
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Keep Plugin commands between vundle#begin/end.
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " vundle

Plugin 'scrooloose/nerdcommenter' " comment related inserts plugin

Plugin 'qpkorr/vim-bufkill' " bud/bd/bw without closing window plugin

Plugin 'ctrlpvim/ctrlp.vim' " fuzzy file/buffer/mru/tag finder for vim

Plugin 'pangloss/vim-javascript' " more advanced syntax highlighting for javascript
Plugin 'mxw/vim-jsx' " JSX syntax highlighting

Plugin 'tpope/vim-unimpaired' " map [q ]q, etc to quickfix related iterations (and more)

Plugin 'kchmck/vim-coffee-script' " coffescript syntax highlighting

Plugin 'tpope/vim-fugitive' " git wrapper for vim

Plugin 'tpope/vim-rhubarb' " fugitive extension for web actions (ie Gbrowse)

Plugin 'tpope/vim-surround' " surround selection blocks

Plugin 'rizzatti/dash.vim' " Dash API documentation lookup

Plugin 'kana/vim-textobj-user' " custom text objecs (required for vim-textobj-rubyblock plugin)

Plugin 'nelstrom/vim-textobj-rubyblock' " add ruby block selections (ir/ar)

" TODO: look to use vim-plug (as it supports using local install at `/usr/local/opt/fzf` fzf instead of cloning whole project)
Plugin 'junegunn/fzf' " Baseline fzf plugin (still required for vim)

Plugin 'junegunn/fzf.vim' " FZF integration plugin

" gui focused plugins
Plugin 'bling/vim-airline' " airline for visual goodness

Plugin 'vim-airline/vim-airline-themes' " themes for airline

Plugin 'bling/vim-bufferline' " bufferline for airline

Plugin 'tomlion/vim-solidity' " solidity syntax highlighting

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
