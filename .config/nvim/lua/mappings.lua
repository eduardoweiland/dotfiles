vim.g.mapleader = '\\'

local map = vim.api.nvim_set_keymap

-- Move lines up and down (Alt+j Alt+k)
map('n', '<A-j>', ':m .+1<CR>==', { silent = true, noremap = true })
map('n', '<A-k>', ':m .-2<CR>==', { silent = true, noremap = true })
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { silent = true, noremap = true })
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { silent = true, noremap = true })
map('v', '<A-j>', ':m \'>+1<CR>gv=gv', { silent = true, noremap = true })
map('v', '<A-k>', ':m \'<-2<CR>gv=gv', { silent = true, noremap = true })

-- Resize splits (Shift+[hjkl])
map('n', '<A-Left>', ':call ResizeLeft(3)<CR><Esc>', { silent = true, noremap = true })
map('n', '<A-Right>', ':call ResizeRight(3)<CR><Esc>', { silent = true, noremap = true })
map('n', '<A-Up>', ':call ResizeUp(1)<CR><Esc>', { silent = true, noremap = true })
map('n', '<A-Down>', ':call ResizeDown(1)<CR><Esc>', { silent = true, noremap = true })

-- Make [xdsc] use black hole register (do not yank)
for _, key in pairs({ 'x', 'X', 'd', 'D', 'c', 'C', 's', 'S' }) do
  map('n', key, '"_' .. key, { noremap = true })
  map('v', key, '"_' .. key, { noremap = true })
end
map('n', 'dd', '"_dd', { noremap = true })
map('n', 'cc', '"_cc', { noremap = true })

-- And <leader>d to yank to clipboard
for _, key in pairs({ 'd', 'D' }) do
  map('n', '<leader>' .. key, '"+' .. key, { noremap = true })
  map('v', '<leader>' .. key, '"+' .. key, { noremap = true })
end
map('n', '<leader>dd', '"+dd', { noremap = true })

-- Toggle NvimTree
map('n', '<leader>b', ':NvimTreeToggle<CR>', { silent = true })
map('v', '<leader>b', ':NvimTreeToggle<CR>', { silent = true })
