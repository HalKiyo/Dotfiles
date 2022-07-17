syntax on

set nowritebackup
set nobackup
set virtualedit=block
set backspace=indent,eol,start

set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

set belloff=all
set shellslash
set showmatch matchtime=1

set cinoptions+=:1
set display=lastline
set list
set listchars=tab:^\ ,trail:~
set history=1000

set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4

set guioptions-=T
set guioptions-=m
set guioptions-=R

set smartindent
set nowrap
set noswapfile
set nofoldenable

set clipboard=unnamedplus,autoselect
set nrformats=
set whichwrap=b,s,h,l,<,>,[,],~
set mouse=a

set nu
set guicursor=
set cursorline
set showcmd
set laststatus=2
set statusline=%F

let mapleader = ' '

inoremap <silent> jj <ESC>
vnoremap v <C-v>
nnoremap Y y$
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>



call plug#begin('/home/hasegawa/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

call plug#end()


" #######configration of gruvbox#######
colorscheme gruvbox
set background=dark

highlight StatusLine ctermbg=Yellow ctermfg=DarkGray guifg=darkblue guibg=yellow
highlight LineNr ctermfg=0*

" #######configration of coc.nvim######
set encoding=utf-8
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" #######configration of python-syntax#######
let g:python_highlight_all = 1
