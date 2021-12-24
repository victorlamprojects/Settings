# Vim Setup
## Linux
### 1. Install vim-plug
(https://github.com/junegunn/vim-plug#vim)
### 2. Place the below content in ```~/.vimrc```
```
syntax on
set autoindent
set relativenumber
set cursorline
set tabstop=4 softtabstop=4
set shiftwidth=4
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'mbbill/undotree'
call plug#end()

colorscheme gruvbox
set background=dark
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:ctrlp_use_caching = 0
let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
```
### 3. Open the file using vim
```
vim ~/.vimrc`
```
### 4. Install plugins
```
:PlugInstall
```
### 5. Create a folder ```~/.vim/undodir```

## Windows
### 1. Install vim-plug
(https://github.com/junegunn/vim-plug#windows-powershell)
### 2. Place the below content in ```C:\Users\XXXX\.vimrc```
```
syntax on
set autoindent
set relativenumber
set cursorline
set tabstop=4 softtabstop=4
set shiftwidth=4
set noswapfile
set nobackup
set undodir=$HOME/vimfiles/undodir
set undofile
set incsearch

call plug#begin('$HOME/vimfiles/plugged')
Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'mbbill/undotree'
call plug#end()

colorscheme gruvbox
set t_Co=256
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:ctrlp_use_caching = 0
let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
```
### 3. Open the file using vim
CMD:
```
vim C:\Users\XXXX\.vimrc`
```
Powershell:
```
vim ~\.vimrc
```
### 4. Install plugins
```
:PlugInstall
```
### 5. Create a folder ```C:\Users\XXXX\vimfiles\undodir```
