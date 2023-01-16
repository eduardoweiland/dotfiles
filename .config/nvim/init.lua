require('options')
require('plugins')
require('mappings')

-- Disable search highlight after substitute
local auto_searchhl = vim.api.nvim_create_augroup('auto_searchhl', { clear = true })
vim.api.nvim_create_autocmd('CmdlineLeave', {
  pattern = ':',
  callback = function()
    if (vim.fn.getcmdline():find('s/')) then
      vim.defer_fn(function() vim.cmd([[nohlsearch]]) end, 0)
    end
  end,
  group = auto_searchhl,
})
