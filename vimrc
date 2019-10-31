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

NeoBundle 'vimwiki/vimwiki'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'peitalin/vim-jsx-typescript'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'valloric/youcompleteme'
NeoBundle 'yuttie/comfortable-motion.vim'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vimwiki/vimwiki'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax enable
filetype plugin on
filetype indent on

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

autocmd BufNewFile,BufRead *.psgi set filetype=perl

autocmd BufWritePre * :call TrimAll()


inoremap `` <Esc>/<++><cr>"_c4l

autocmd FileType c,h inoremap `linc #include "<-->"<Esc>:MoveFirst<cr>i
autocmd FileType c,h inoremap `ginc #include <<-->><Esc>:MoveFirst<cr>i

set mouse=a
" setup for NERDTree
let g:NERDTreeWinPos = "right"
map <C-n> :NERDTreeToggle<CR>

" setup smooth scroll
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>

nnoremap <silent> <C-f> :call comfortable_motion#flick(200)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-200)<CR>

noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(1)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-1)<CR>


" vimwiki settings to accept markdown
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
