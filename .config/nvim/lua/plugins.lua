local fn = vim.fn

local builtins_to_disable = {
  '2html_plugin',
  'gzip',
  'man',
  'matchit',
  'netrwPlugin',
  'spellfile_plugin',
  'tarPlugin',
  'tutor_mode_plugin',
  'zipPlugin',
}
for _, plugin in pairs(builtins_to_disable) do
  vim.g['loaded_' .. plugin] = true
end

-- Install packer plugin manager
local packer_bootstrap
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth=1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  vim.cmd([[packadd packer.nvim]])
end

require('packer').startup({
  function(use)
    -- Plugin manager
    use({ 'wbthomason/packer.nvim' })

    -- Improve loading of lua modules
    use({
      'lewis6991/impatient.nvim',
      config = function() require('impatient') end,
    })

    -- TreeSitter plugin
    use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      event = { 'BufRead', 'BufNewFile' },
      config = function()
        require('nvim-treesitter.configs').setup({
          ensure_installed = { 'css', 'javascript', 'lua', 'php', 'rust', 'terraform', 'typescript', 'vue' },
        })
      end,
    })

    -- Colorscheme
    use({
      'navarasu/onedark.nvim',
      config = function()
        require('onedark').setup({
          style = 'darker',
          colors = {
            bg0 = '#1c1f25',
            bg1 = '#24282f',
            bg2 = '#2b3139',
            bg3 = '#2d313a',
            grey = '#5d6472',
          },
        })
        require('onedark').load()
      end,
    })

    -- Status line
    use({
      'nvim-lualine/lualine.nvim',
      event = { 'BufRead', 'BufNewFile' },
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function() require('lualine').setup() end,
    })

    -- File explorer tree.
    use({
      'nvim-tree/nvim-tree.lua',
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function() require('nvim-tree').setup() end,
    })

    -- Easy navigation between tmux and nvim
    use({ 'christoomey/vim-tmux-navigator' })

    -- Resize Neovim splits
    use({ 'artart222/vim-resize' })

    -- Git integration
    use({
      'tpope/vim-fugitive',
      cmd = { 'Git', 'G' },
    })

    -- File status from Git (lines added, modified, removed etc.)
    use({
      'lewis6991/gitsigns.nvim',
      event = { 'BufRead', 'BufNewFile' },
      config = function() require('gitsigns').setup() end,
    })

    -- Show Git diff when commiting
    use({ 'rhysd/committia.vim' })

    -- Word motions
    use({ 'chaoren/vim-wordmotion' })

    -- LSP (TODO complete config)
    use({ 'neovim/nvim-lspconfig' })

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function() return require('packer.util').float() end,
    },
  },
})
