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
        'bash', 'html', 'css', 'dockerfile', 'javascript', 'json', 'lua', 'markdown',
        'php', 'rust', 'terraform', 'toml', 'typescript', 'vue', 'xml', 'yaml',
      },
    },
    main = 'nvim-treesitter.configs',
  },
}
