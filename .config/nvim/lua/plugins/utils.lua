return {
  -- Scope buffers to tabs
  { 'tiagovla/scope.nvim', config = true },

  -- Don't mess with window layout when closing buffers
  { 'famiu/bufdelete.nvim' },

  -- Easy navigation between tmux and nvim
  { 'christoomey/vim-tmux-navigator' },

  -- Resize Neovim splits
  { 'artart222/vim-resize' },

  -- Word motions
  { 'chaoren/vim-wordmotion' },

  -- Highlight word under cursor
  { 'RRethy/vim-illuminate', event = { 'BufRead', 'BufNewFile' } },
}
