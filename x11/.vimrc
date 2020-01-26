syntax on
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set cursorline  
set autoindent
set smartindent
set ignorecase
set smartcase
set wildignorecase
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set autoread
set wrap
set linebreak
set wildmenu
set lazyredraw
set incsearch
set hlsearch
set history=1000
let mapleader = ","
let maplocalleader = ","
set mouse=a
set spell
set clipboard=unnamedplus
set shortmess+=c

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-obsession'

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'mhinz/vim-signify'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'jalvesaq/Nvim-R'
Plug 'dart-lang/dart-vim-plugin'

" Plug 'scrooloose/syntastic'

" Initialize plugin system
call plug#end()

colorscheme gruvbox
nmap <leader>f :NERDTreeToggle<CR>

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:livepreview_previewer = 'zathura'

inoremap <C-c> <esc>
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'

" Make sure that movement operators move by visual line rather than physical one.
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
onoremap <silent> j gj
onoremap <silent> k gk

source /home/kdryja/.vim-coc
let g:python3_host_prog = "$HOME/.pyenv/versions/3.8.1/bin/python" 

let g:coc_global_extensions = ["coc-python", "coc-json", "coc-tsserver", "coc-html", "coc-css", "coc-markdownlint", "coc-texlab"]
set statusline^=%{coc#status()}

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

