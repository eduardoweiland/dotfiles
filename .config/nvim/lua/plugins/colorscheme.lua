return {
  {
    'navarasu/onedark.nvim',
    opts = {
      style = 'darker',
      colors = {
        bg0 = '#1e2127',
      },
    },
    config = function(_, opts)
      require('onedark').setup(opts)
      require('onedark').load()
    end,
  },
}
