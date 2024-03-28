return {
  {
    'akinsho/bufferline.nvim',
    event = { 'VeryLazy' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        diagnostics = 'nvim_lsp',
        numbers = function(opts) return opts.raise(opts.id) end,
        show_close_icon = false,
        separator_style = 'slant',
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'Explorer',
            text_align = 'center',
            highlight = 'Directory',
            separator = true,
          },
        },
      },
    }
  },
}
