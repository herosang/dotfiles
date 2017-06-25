
" insert(s)/append(S) a single character. Can be repeated <count>s
" NOTE: overwrites s and S commands, but can still be accessed with cl and cc respectively
" grabbed from: (http://vim.wikia.com/wiki/Insert_a_single_character)
function! RepeatChar(char, count) dict
  return repeat(a:char, a:count)
endfunction
nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

