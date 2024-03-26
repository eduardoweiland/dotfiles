return {
  {
    'nvim-tree/nvim-tree.lua',
    event = { 'VeryLazy' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      sync_root_with_cwd = true,
      renderer = {
        root_folder_label = false,
        indent_markers = { enable = true, },
      },
      view = { width = 40, },
      update_focused_file = { enable = true, },
    }
  },
}
