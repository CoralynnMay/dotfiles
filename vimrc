" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'sirver/ultisnips'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax enable
filetype plugin on
filetype indent on

" <C-O> remap to pad up and down with 1 line
nnoremap <C-O> o<cr><esc>ki

" Tab settings
set softtabstop=2
set shiftwidth=2
set noexpandtab

" Snippit setting
let g:UltiSnipsSnippetsDir=$HOME."/.dot/snippits/"
let g:UltiSnipsSnippetDirectories=[g:UltiSnipsSnippetsDir]
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

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
set number

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
