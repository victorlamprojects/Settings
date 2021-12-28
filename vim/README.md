# Vim Setup
1. [Linux](#Linux)
2. [Windows](#Windows)
3. [Visual Studio Code](#VSCode)


## Linux
### 1. Install vim-plug
(https://github.com/junegunn/vim-plug#vim)
### 2. Install ripgrep (which is much faster substitute of grep)
```
sudo apt-get install ripgrep
```
### 3. Place the below content in ```~/.vimrc```
```
syntax on
set path+=**
set wildmenu
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
set wildignore=*/dist*/*,*/target/*,*/builds/*,*/node_modules/*

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'mbbill/undotree'
Plug 'jremmen/vim-ripgrep'
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
nnoremap <leader>q :wincmd q<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
```
### 4. Open the file using vim
```
vim ~/.vimrc`
```
### 5. Install plugins
```
:PlugInstall
```
### 6. Create a folder ```~/.vim/undodir```

## Windows
### 1. Install vim-plug
(https://github.com/junegunn/vim-plug#windows-powershell)
### 2. Install ripgrep (which is much faster substitute of grep)
```
choco install ripgrep
```
*Note that if you have not installed choco, you can install it with

(fyi: https://chocolatey.org/install)
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
### 3. Place the below content in ```C:\Users\XXXX\.vimrc```
```
syntax on
set path+=**
set wildmenu
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
set wildignore=*/dist*/*,*/target/*,*/builds/*,*/node_modules/*

call plug#begin('$HOME/vimfiles/plugged')
Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'mbbill/undotree'
Plug 'jremmen/vim-ripgrep'
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
nnoremap <leader>q :wincmd q<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
```
### 4. Open the file using vim
CMD:
```
vim C:\Users\XXXX\.vimrc`
```
Powershell:
```
vim ~\.vimrc
```
### 5. Install plugins
```
:PlugInstall
```
### 6. Create a folder ```C:\Users\XXXX\vimfiles\undodir```

## Visual Studio Code <a name="VSCode"></a>
### Append the following to settings.json
```
    "vim.leader": " ",
    "vim.vimrc.enable": true,
    "vim.useCtrlKeys": true,
    "vim.normalModeKeyBindings": [
        {
            "before": ["<leader>", "h"],
            "after": [
                "<C-w>", "h", "<CR>"
            ]
        },
        {
            "before": ["<leader>", "j"],
            "after": [
                "<C-w>", "j", "<CR>"
            ]
        },
        {
            "before": ["<leader>", "k"],
            "after": [
                "<C-w>", "k", "<CR>"
            ]
        },
        {
            "before": ["<leader>", "l"],
            "after": [
                "<C-w>", "l", "<CR>"
            ]
        },
        {
            "before": ["<leader>", "q"],
            "after": [
                "<C-w>", "q", "<CR>"
            ]
        }
    ]
```
