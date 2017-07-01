set nocompatible

syntax enable
filetype plugin on
filetype indent on

" Provide tab completion for all file related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Make tags for for definition searching
command! MakeTags !ctags -R .

" Display line numbers
set relativenumber

" Trims white space at end of lines and files
function TrimAll()
    let save_cursor = getpos(".")
    :silent! %s/\s\+$//e
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

autocmd BufWritePre * :call TrimAll()

inoremap ;; <Esc>/<++><cr>"_c4l
