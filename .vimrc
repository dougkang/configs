set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

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

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1

" *** END python-specific settings

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=**/node_modules/**,**/project/**,**/target/**,Applications/**,Library/**,bin/**,lib/**,include/**


" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Initialize powerline, set to absolute path to make sure it works even in
" virtualenv
python import sys; sys.path.append("/Users/dougkang/Library/Python/2.7/lib/python/site-packages")
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

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
