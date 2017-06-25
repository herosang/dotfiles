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
" matches using format:
"   <tags_path>*.<filetype>.tags
" tagfiles follow format:
"   rails_global_whatever_here.ruby.tags
"       java_api_whatever_here.java.tags
if !exists('AddTags')
  function AddTags(filetype, tags_path)
    let tagfiles= substitute(glob(a:tags_path . '*.' . a:filetype . '.tags'), "\n", ",", "g")
    return tagfiles
  endfunction
endif
