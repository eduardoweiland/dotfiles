return {
  -- Git integration
  { 'tpope/vim-fugitive', cmd = { 'Git', 'G' } },

  -- File status from Git (lines added, modified, removed etc.,
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = true,
  },

  -- Show Git diff when commiting
  { 'rhysd/committia.vim', ft = { 'gitcommit' } },
}
