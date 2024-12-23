vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.cmd([[ set noswapfile ]])

--Line numbers
vim.wo.number = true

-- clipboard stuff
vim.opt.clipboard = "unnamedplus"

-- hide cmdline
vim.opt.cmdheight = 0

vim.wo.relativenumber = true

-- ignore case
vim.opt.ignorecase = true

-- spell check
vim.opt.spell = true
vim.opt.spelllang = "en_us"
