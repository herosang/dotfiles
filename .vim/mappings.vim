"" Custom mappings

" set leader command in map, ie ',' substituded with <leader>
let mapleader=' '

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

" map return to mark of position of last change
nnoremap '<space> '.

" map return to mark of (exact) position of last insert (exat row/col ` instead of exact row ' )
nnoremap <A-'><space> `^

" map <Leader>d to plugin bdelete WITHOUT closing window
nnoremap <Leader>d :BD<CR>

" set <Leader>space in normal mode to clear the search register
nnoremap <Leader><space> :let @/=""<CR>

" set <Leader>/ in normal mode to yank search register to * register
nnoremap <Leader>/ :let @*=@/<CR>

" set <Leader>% in normal mode to yank file path register to * register
nnoremap <Leader>% :let @*=@%<CR>

" map <Leader>; to replace first character of every word on current line to uppercase
nmap <Leader>; :s/\w\+/\u&/g<CR>:let @/=""<CR>

" map <Leader> to p to open CtrlP in normal (file) mode
nnoremap <Leader>p :CtrlP<CR>

" map <Leader> to p to open CtrlP in buffer mode 
nnoremap <Leader>P :CtrlPBuffer<CR>

" map <Alt-8> (• char on OSX) to set the search value to the word under the current cursor (wrapped with \< \>)
nnoremap <A-8> :let @/="\\<" . expand("<cword>") . "\\>"<CR>

" FZF mappings

" map ctrl+f to open FZF files search
nnoremap <c-f> :Files<CR>

" map <Leader>a to ag search
nnoremap <Leader>a :Ag<CR>

" map <Leader>a to search tags
nnoremap <Leader>t :Tag<CR>
