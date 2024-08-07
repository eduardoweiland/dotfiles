return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufRead', 'BufNewFile' },
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    opts = {
      highlight = { enable = true, },
      indent = { enable = true, },
      ensure_installed = {
        'bash', 'html', 'css', 'dockerfile', 'glimmer', 'javascript', 'json', 'lua', 'markdown',
        'php', 'rust', 'terraform', 'toml', 'typescript', 'vimdoc', 'vue', 'xml', 'yaml',
      },
    },
    main = 'nvim-treesitter.configs',
  },
}
