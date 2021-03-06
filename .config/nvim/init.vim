syntax on
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set cursorline  
set autoindent
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
set inccommand=split
set nobackup
set nowritebackup
set hidden
set cmdheight=2
set updatetime=300
set signcolumn=yes
set redrawtime=10000
set list listchars=tab:\|\ ,trail:. 
set splitright
set fdm=marker
set foldlevel=99
set conceallevel=0

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin('~/.local/share/nvim/plugged')

" tpope plugins {{{
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-obsession'
" }}}

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'tomlion/vim-solidity'
Plug 'junegunn/fzf.vim'
Plug 'sebdah/vim-delve'
Plug 'sedm0784/vim-you-autocorrect'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'

" Initialize plugin system
call plug#end()

let g:coc_global_extensions=[
  \'coc-explorer',
  \'coc-python',
  \'coc-json',
  \'coc-tsserver',
  \'coc-html',
  \'coc-css',
  \'coc-prettier',
  \'coc-highlight',
  \'coc-yank',
  \'coc-pairs',
  \'coc-markdownlint',
  \'coc-sh',
  \'coc-dictionary',
  \'coc-texlab',
  \'coc-word'
  \]

colorscheme gruvbox

let g:livepreview_previewer = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'

" Make sure that movement operators move by visual line rather than physical one.
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
onoremap <silent> j gj
onoremap <silent> k gk

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" let g:go_fmt_command = "goimports"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

noremap <silent> <C-p> :Files<CR>
inoremap jj <Esc>
inoremap <C-c> <Esc>

let g:go_fmt_fail_silently = 1
autocmd BufEnter * :syntax sync fromstart
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:airline#extensions#tabline#show_buffers = 0

nnoremap <space>e :CocCommand explorer<CR>

" CoC Specific settings {{{
let g:python3_host_prog = "/usr/bin/python" 

" Use tab for trigger completion with characters ahead and navigate.
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
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight on cursor hold 
autocmd CursorHold * silent call CocActionAsync('highlight')

" Open yanklist
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
 " Remap for format selected region
nmap <leader>t  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" }}}
