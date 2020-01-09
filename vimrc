" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'danilo-augusto/vim-afterglow'
Plug 'jparise/vim-graphql'
Plug 'dhruvasagar/vim-table-mode', {'tag': '*'}
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'elm-tooling/elm-vim'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.

syntax enable
filetype plugin on
filetype indent on

" Tab settings
set softtabstop=4
set shiftwidth=4
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


autocmd BufNewFile,BufRead *.psgi set filetype=perl

autocmd BufWritePre * :call TrimAll()
" autocmd BufWritePre *.elm :Elm-Format

let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

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

let g:elm_format_autosave = 1

let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

let g:afterglow_inherit_background=1
colorscheme afterglow

" CoC

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
