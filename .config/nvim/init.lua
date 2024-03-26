require('options')

-- Install lazy.nvim plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from lua modules and configure lazy
require('lazy').setup('plugins', {
  performance = {
    rtp = {
      disabled_plugins = {
        '2html_plugin', 'gzip', 'man', 'matchit', 'netrwPlugin', 'spellfile_plugin',
        'tarPlugin', 'tutor_mode_plugin', 'zipPlugin',
      },
    },
  },
});

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
