return {
  {
    'navarasu/onedark.nvim',
    opts = {
      style = 'darker',
      colors = {
        bg0 = '#1c1f25',
        bg1 = '#24282f',
        bg2 = '#2b3139',
        bg3 = '#2d313a',
        grey = '#5d6472',
      },
    },
    config = function(_, opts)
      require('onedark').setup(opts)
      require('onedark').load()
    end,
  },
}
