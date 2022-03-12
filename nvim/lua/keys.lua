local api = vim.api

vim.g.mapleader = " "

local opt = { noremap = true, silent = false }

api.nvim_set_keymap('i', 'jj', '<Esc>', opt)

api.nvim_set_keymap('n', 'j', 'gj', opt)
api.nvim_set_keymap('n', 'k', 'gk', opt)

api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', opt)
api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', opt)
api.nvim_set_keymap('n', '<Leader>v', ':vs<CR>', opt)
api.nvim_set_keymap('n', '<Leader>o', ':only<CR>', opt)

api.nvim_set_keymap('n', '<Leader>h', '<C-w>h', opt)
api.nvim_set_keymap('n', '<Leader>j', '<C-w>j', opt)
api.nvim_set_keymap('n', '<Leader>k', '<C-w>k', opt)
api.nvim_set_keymap('n', '<Leader>l', '<C-w>l', opt)

api.nvim_set_keymap('v', '<Leader>y', '"+y', opt)
api.nvim_set_keymap('n', '<Leader>p', '"+p', opt)
api.nvim_set_keymap('n', '<Leader>P', '"+P', opt)
api.nvim_set_keymap('v', '<Leader>p', '"+p', opt)
api.nvim_set_keymap('v', '<Leader>P', '"+P', opt)

api.nvim_set_keymap('n', '<Leader><C-d>', '<cmd> lua vim.diagnostic.open_float()<CR>', opt)
api.nvim_set_keymap('n', '<Leader>n', '<cmd> lua vim.diagnostic.goto_next()<CR>', opt)
api.nvim_set_keymap('n', '<Leader>N', '<cmd> lua vim.diagnostic.goto_prev()<CR>', opt)
