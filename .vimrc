set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/xptemplate'
Plug 'derekwyatt/vim-scala'
Plug 'jpalardy/vim-slime'
Plug 'majutsushi/tagbar'
Plug 'elzr/vim-json'
Plug 'janko-m/vim-test'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'

call plug#end()

" default settings
set encoding=utf-8
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber
set cursorline cursorcolumn
let &colorcolumn=join(range(101,999),",")
highlight CursorColumn ctermbg=235 guibg=#2c2d27
highlight ColorColumn ctermbg=235 ctermfg=DarkGray guibg=#2c2d27
highlight CursorLine cterm=NONE ctermbg=235 guibg=#2c2d27
set clipboard=unnamed

syntax on
set ruler
set tags=tags=./.tags,.tags;$HOME

" *** START Python-specific settings

" Python settings that adhere to PEP8
au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix

let python_highlight_all=1

" *** END python-specific settings

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=**/node_modules/**,**/project/**,**/target/**,Applications/**,Library/**,bin/**,lib/**,include/**
set wildignore+=**/venv/**

" Airline settings
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''

" netrw settings so that its like NERDtree
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25

" make test commands execute using dispatch.vim and pytest
let test#strategy = "dispatch"
let test#python#runner = 'pytest'
let g:test#preserve_screen = 1

" ackprg
let g:ackprg = 'ag --nogroup --nocolor --column'

" My shortcuts
nnoremap <Space> <Nop>
let mapleader=' '
let g:mapleader=' '

" Remap write commands
nnoremap <leader>w :w<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>wqa :wqa<cr>
nnoremap <leader>q :q!<cr>

nnoremap <silent> <leader>sp :sp<cr>
nnoremap <silent> <leader><leader>sp :vsp<cr>

nnoremap <silent> <leader>n :bn<cr>
nnoremap <silent> <leader>p :bp<cr>

nnoremap <leader>l <c-w>l<cr>
nnoremap <leader>k <c-w>k<cr>
nnoremap <leader>j <c-w>j<cr>
nnoremap <leader>h <c-w>h<cr>

nnoremap <leader><leader>l <c-x>l<cr>
nnoremap <leader><leader>p <c-x>p<cr>
nnoremap <leader><leader>f <c-x>f<cr>

nnoremap <silent> <leader><leader>n :Vexplore<cr>

nnoremap <silent> <leader><leader>p :CtrlP<cr>
nnoremap <silent> <leader><leader><leader>t :TagbarToggle<cr>

nmap <silent> <leader><leader>t :TestNearest<CR>
nmap <silent> <leader><leader>T :TestFile<CR>
nmap <silent> <leader><leader>a :TestSuite<CR>
nmap <silent> <leader><leader>l :TestLast<CR>
nmap <silent> <leader><leader>g :TestVisit<CR>
