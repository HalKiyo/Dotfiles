"マッピングに関するMEMO
"noreがつくもととつかないものの違い(mapとnoremap)
"noreがつかないものを使うと、キーの再割り当てが発生する
"->mapはキーシーケンスを展開した後、さらに別のマップを適用しようとする
"->noremapは一度だけ展開する
"(例)
"map {A} {X}
"map {B} {A}
"上のようにマッピングされている場合,Bを押すとAが実行され、さらにAに割り当てられたXが実行される
"noremapだとマッピングは一度しか展開しない
"混乱を避けるためnore系を利用するのが無難かも
"
"(チートシート)
"noremap: ノーマルモード+ビジュアルモード
"noremap!: コマンドラインモード+インサートモード
"nnoremap: ノーマルモード
"vnoremap: ビジュアルモード
"cnoremap: コマンドラインモード
"inoremap: インサートモード
"tnoremap: ターミナルモード
"
"terminalコマンドのprefixは<C-w>

syntax on
set re=0 " prevent 'red raw error'

set encoding=utf-8
scriptencoding utf-8
set confirm
set paste!

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

let g:coc_disable_startup_warning = 1
let mapleader = ' '

inoremap <silent> jj <ESC>
vnoremap v <C-v>
nnoremap Y y$
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
nnoremap <silent> <leader>j <C-w>j :q<CR> :bo terminal ++open ++rows=10 python3 %<CR> <C-w>k
nnoremap <silent> <leader>J :bo terminal ++open ++rows=10 python3 %<CR> <C-w>k
nnoremap <silent> <leader>q <C-w>j :q!<CR> :q<CR>
tnoremap <Esc> <C-w>N


call plug#begin('/home/hasegawa/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'cohama/lexima.vim'

call plug#end()

" #######configration of gruvbox#######
colorscheme gruvbox
set background=dark
highlight StatusLine ctermbg=Yellow ctermfg=DarkGray guifg=darkblue guibg=yellow

" #######configration of coc.nvim######
nnoremap <silent> <leader>g <Plug>(coc-diagnostic-prev)
nnoremap <silent> <leader>G <Plug>(coc-diagnostic-next)

" #######configration of python-syntax#######
let g:python_highlight_all = 1

" #######configration of fzf######
let $FZF_DEFAULT_OPTS="--layout=reverse"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5, 'border': 'sharp' } }
nnoremap <silent> <leader>f :Files<CR>
"nnoremap <silent> <leader>f :GFiles<CR>
"nnoremap <silent> <leader>b :Buffers<CR>
"nnoremap <silent> <leader>h :History<CR>
"nnoremap <silent> <leader>r :Rg<CR>
