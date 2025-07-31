-- global settings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- options

-- rendering
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.showbreak = '↪ '
vim.opt.listchars = 'tab:→ ,nbsp:␣,trail:•,extends:>,precedes:<'
vim.opt.wrap = false
vim.opt.number = true

-- number line
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = 'auto'

-- tabs
local tab_width = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = tab_width
vim.opt.tabstop = tab_width
vim.opt.softtabstop = tab_width

-- cursor and columns
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"

-- command line
vim.opt.cmdheight = 2

-- searching
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildoptions = 'fuzzy,pum,tagfile'

-- scrolling
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- folding
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir/'
