vim.g.mapleader = '\\'

local map = vim.api.nvim_set_keymap

-- Move lines up and down
map('n', '<A-j>', ':m .+1<CR>==', { silent = true, noremap = true })
map('n', '<A-k>', ':m .-2<CR>==', { silent = true, noremap = true })
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { silent = true, noremap = true })
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { silent = true, noremap = true })
map('v', '<A-j>', ':m \'>+1<CR>gv=gv', { silent = true, noremap = true })
map('v', '<A-k>', ':m \'<-2<CR>gv=gv', { silent = true, noremap = true })
