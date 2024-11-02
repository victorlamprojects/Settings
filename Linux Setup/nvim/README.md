# NVim Setup
## 0. Install NVIM (https://github.com/neovim/neovim/releases)
### File Structure (https://learnvimscriptthehardway.stevelosh.com/chapters/42.html)
```
$HOME/.config
└───nvim
    └───init.vim        # Root config file
    └───maps.vim        # keymaps
    └───plugged/        # vim-plug
    └───plugin/         # Run every time vim starts
    └───after           # Post-init scripts
    │   └───plugin/     # Plugin configs
    └───colors/         # Color themes
```
## 1. Install vim-plug
(https://github.com/junegunn/vim-plug#neovim)
## 2. Install ripgrep (which is much faster substitute of grep)
```
sudo apt-get install ripgrep
```
## 3. Download fonts for dev-icons
(https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/VictorMono/Light/complete/Victor%20Mono%20Light%20Nerd%20Font%20Complete.ttf)
## 4. Place the below content in ```~/.config/nvim/init.vim```
```
syntax on
set encoding=UTF-8
set path+=**
set nu
set nowrap
set nohlsearch
set wildmenu
set autochdir
set autoindent
set relativenumber
set cursorline
set tabstop=4 softtabstop=4
set shiftwidth=4
set noswapfile
set nobackup
set incsearch
set scrolloff=8
set wildignore=*/dist*/*,*/target/*,*/builds/*,*/node_modules/*
set wildmode=longest:full
set foldmethod=marker
set signcolumn=yes

call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'leafgarland/typescript-vim'
Plug 'williamboman/mason.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'neovim/nvim-lspconfig'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme gruvbox
set background=dark
highlight Normal     ctermbg=NONE
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25
let NERDTreeShowHidden=1
let g:ctrlp_use_caching = 0
let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :wincmd q<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>pn :lua require('telescope.builtin').find_files()<CR>
nnoremap <silent><leader>ls <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent><leader>lh :Lspsaga hover_doc<CR>
nnoremap <silent><leader>lr :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>ld <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>la <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><leader>l; :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent><leader>l, :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent><leader>rn :Lspsaga rename<CR>
nnoremap <silent><A-t> :Lspsaga open_floaterm<CR>
tnoremap <silent><A-d> <C-\><C-n> :Lspsaga close_floaterm<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup VICTOR
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
augroup END

if has("persistent_undo")
   let target_path = expand('~/.config/nvim/undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

if !isdirectory($HOME . '/.config/nvim/plugged')
	call mkdir($HOME . '/.config/nvim/plugged', "p", 0700)
endif

lua << EOF
require'lspfuzzy'.setup {}
require'lspconfig'.tsserver.setup{}
require'lspsaga'.setup {}
EOF
```
## 5. Reload Config Files
```
:source $MYVIMRC
```
## 6. Install plugins
```
:PlugInstall
```
## 7. Install LSP Server
```
sudo npm install -g typescript typescript-language-server
```
