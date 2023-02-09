" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
"set cursorline

" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn

set shortmess+=I

set relativenumber

set laststatus=2

set backspace=indent,eol,start

set ignorecase
set smartcase

set incsearch

nmap Q <Nop>

set noerrorbells visualbell t_vb=

set mouse+=a


" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

colorscheme monokai

set guifont=Fira\ Code:h12

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


 " Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

 " Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs),'!isdirectory(v:val.dir)'))
 \| PlugInstall --sync | source $MYVIMRC
 \| endif

 " install plugins
call plug#begin()
  Plug 'preservim/nerdtree'
call plug#end()
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'bfrg/vim-cpp-modern' |
            \ Plug 'xavierd/clang_complete' |
            \ Plug 'vim-airline/vim-airline' |
	    \ Plug 'tpope/vim-commentary' |
	    \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
            \ Plug 'ryanoasis/vim-devicons' 


set encoding=UTF-8

"" NERDTREE PLUGIN 
 " shortcuts for NerdTree
 nnoremap <leader>n :NERDTreeFocus<CR>
 nnoremap <C-n> :NERDTree<CR>
 nnoremap <C-t> :NERDTreeToggle<CR>
 nnoremap <C-f> :NERDTreeFind<CR>

 " Start NERDTree when Vim starts with a directory argument.
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
     \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
 " Exit Vim if NERDTree is the only window remaining in the only tab.
 autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" Highlight struct / class member variables
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1


" clang_complete
let g:clang_library_path='/usr/lib/llvm-10/lib/libclang-10.so.1'
