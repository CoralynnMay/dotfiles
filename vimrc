set nocompatible

source $HOME/.vimbundle

syntax enable
filetype plugin on
filetype indent on

" <C-O> remap to pad up and down with 1 line
nnoremap <C-O> o<cr><esc>ki

" Tab settings
set softtabstop=2
set shiftwidth=2
set noexpandtab

" Split navigation set to ctrl hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Split lower and to right
set splitbelow
set splitright

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

function MoveFirst()
  if search("<-->", 'b') > 0
    :normal "_d4l
  endif
endfunction
command MoveFirst :call MoveFirst()

autocmd BufWritePre * :call TrimAll()

inoremap `` <Esc>/<++><cr>"_c4l

autocmd FileType c,h inoremap `linc #include "<-->"<Esc>:MoveFirst<cr>i
autocmd FileType c,h inoremap `ginc #include <<-->><Esc>:MoveFirst<cr>i
