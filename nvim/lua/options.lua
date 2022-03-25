vim.o.encoding = "utf-8"

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

vim.o.laststatus = 2

vim.o.hidden = true

vim.o.updatetime = 50

vim.opt.shortmess:append({ c = true })

vim.o.ruler = true
vim.o.number = true
vim.o.cursorline = true
vim.o.smartindent = true

vim.o.background = "dark"
vim.o.termguicolors = true

vim.o.autoread = true

vim.o.incsearch = true
vim.o.wrapscan = true
vim.o.hlsearch = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
