"" Airline Configs

"" Airline Font Configs
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

"" Airline general configs
" set airline theme
let g:airline_theme='papercolor'

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

" fugitive options
" disable showing branch name
let g:airline#extensions#branch#enabled = 0
