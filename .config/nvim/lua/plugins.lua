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
          highlight = {
            enable = true,
          },
          indent = {
            enable = true,
          },
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
      config = function()
        require('lualine').setup({
          extensions = { 'nvim-tree' },
        })
      end,
    })

    -- Telescope
    use({
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
      end,
    })

    -- File explorer tree.
    use({
      'nvim-tree/nvim-tree.lua',
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require('nvim-tree').setup({
          sync_root_with_cwd = true,
          renderer = {
            root_folder_label = false,
            indent_markers = {
              enable = true,
            },
          },
          view = {
            width = 40,
          },
          update_focused_file = {
            enable = true,
          },
        })
      end,
    })

    -- Bufferline
    use({
      'akinsho/bufferline.nvim',
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require('bufferline').setup({
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
        })
      end
    })

    -- Scope buffers to tabs
    use({
      'tiagovla/scope.nvim',
      config = function() require("scope").setup() end,
    });

    -- Don't mess with window layout when closing buffers
    use({ 'famiu/bufdelete.nvim' })

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

    -- LSP
    use({
      'williamboman/mason.nvim',
      config = function() require('mason').setup() end,
    })
    use({
      'williamboman/mason-lspconfig.nvim',
      after = 'mason.nvim',
      config = function() require('mason-lspconfig').setup() end,
    })
    use({
      'neovim/nvim-lspconfig',
      after = 'mason-lspconfig.nvim',
      config = function()
        local on_attach = function(client, bufnr)
          local mapopts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, mapopts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, mapopts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, mapopts)
          vim.keymap.set('n', '<C-p>', vim.lsp.buf.signature_help, mapopts)
          vim.keymap.set('n', 'K',  '<cmd>Lspsaga hover_doc<cr>', mapopts)
          vim.keymap.set('n', 'go', '<cmd>Lspsaga show_line_diagnostics<cr>', mapopts)
          vim.keymap.set('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', mapopts)
          vim.keymap.set('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', mapopts)
          vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', mapopts)
          vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', mapopts)
          vim.keymap.set('x', '<leader>ca', ':<c-u>Lspsaga range_code_action<cr>', mapopts)
        end
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        for _, ls in pairs({ 'cssls', 'ember', 'eslint', 'phpactor', 'rust_analyzer', 'terraformls', 'tsserver', 'volar' }) do
          require('lspconfig')[ls].setup({ on_attach = on_attach, capabilities = capabilities })
        end
      end,
    })

    -- Snippets
    use({ 'L3MON4D3/LuaSnip' })

    -- Autocompletion
    use({
      'hrsh7th/nvim-cmp',
      after = 'LuaSnip',
      config = function()
        local cmp = require('cmp')
        cmp.setup({
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          },
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
          }),
          mapping = {
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<Tab>'] = cmp.mapping.select_next_item(),
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
          },
          experimental = {
            ghost_text = true,
          },
        })
      end,
    })

    -- Provide completions from Language Server
    use({ 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' })

    -- Show function signatures
    use({
      'ray-x/lsp_signature.nvim',
      config = function() require('lsp_signature').setup() end,
    })

    -- UI for LSP actions
    use({
      'nvimdev/lspsaga.nvim',
      config = function()
        require('lspsaga').setup({
          lightbulb = {
            virtual_text = false,
          },
          symbol_in_winbar = {
            enable = false,
          },
        })
      end,
    })

    -- Highlight word under cursor
    use({
      'RRethy/vim-illuminate',
      event = { 'BufRead', 'BufNewFile' },
    })

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
