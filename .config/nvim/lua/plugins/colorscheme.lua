return {
  {
    'navarasu/onedark.nvim',
    opts = {
      style = 'darker',
      colors = {
        bg0 = '#1e2127',
      },
      highlights = {
        IlluminatedWord = { fmt = 'underline' },
        IlluminatedCurWord = { fmt = 'underline' },
        IlluminatedWordText = { fmt = 'underline' },
        IlluminatedWordRead = { fmt = 'underline' },
        IlluminatedWordWrite = { fmt = 'underline' },
      },
    },
    config = function(_, opts)
      require('onedark').setup(opts)
      require('onedark').load()
    end,
  },
}
