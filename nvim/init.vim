set runtimepath^=~/.vim runtimepath+=~/.vim/after 
let &packpath = &runtimepath
"source ~/.vimrc

:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4

:set mouse=a

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'szw/vim-maximizer'
Plug 'kassio/neoterm'

Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

filetype plugin indent on
syntax on

let mapleader = " "

"Custom Window Commands

nnoremap <leader>m :MaximizerToggle!<CR>

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

let g:neoterm_default_mod = 'vertical'
let g:neoterm_size = 60
let g:neoterm_autoinsert = 1
nnoremap <C-q> :Ttoggle<CR>
inoremap <C-q> <Esc> :Ttoggle<CR>
tnoremap <C-q> <C-\><C-n> :Ttoggle<CR>


nnoremap <leader>o :Files<CR>

nnoremap <silent> <M-Down> :m +1<CR>
nnoremap <silent> <M-Up> :m -2<CR>

"Move Lines with option
