-- Left column and similar settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Tab 
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.breakindent = true

-- File
vim.opt.fileencoding = "utf-8"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false 
vim.opt.foldmethod = "marker"
vim.opt.wildignore = {".git, */dist*/*,*/target/*,*/builds/*,*/node_modules/*"}

-- General Behavior
vim.opt.cursorline = true
vim.opt.timeoutlen = 1000
vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard = "unnamedplus" -- enable system clipboard access
vim.opt.showmode = false
vim.opt.conceallevel = 0 -- show concealed characters in markdown files
vim.opt.splitbelow = true -- force horizontal splits below current window
vim.opt.splitright = true -- force vertical splits below current window
vim.opt.termguicolors = true -- enable term GUI colors
vim.opt.undofile = true -- enable persistent undo

-- netrw setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

