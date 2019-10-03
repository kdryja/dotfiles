syntax on
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set cursorline  
set autoindent
set smartindent
set ignorecase
set smartcase
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

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'valloric/youcompleteme'
Plug 'scrooloose/syntastic'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Initialize plugin system
call plug#end()

colorscheme gruvbox
nmap <leader>f :NERDTreeToggle<CR>

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:livepreview_previewer = 'zathura'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

inoremap <C-c> <esc>
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["tex"] }

" Make sure that movement operators move by visual line rather than physical one.
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
onoremap <silent> j gj
onoremap <silent> k gk
