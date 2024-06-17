local on_attach = function(client, bufnr)
  local mapopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, mapopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, mapopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, mapopts)
  vim.keymap.set('n', '<C-p>', vim.lsp.buf.signature_help, mapopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, mapopts)
  vim.keymap.set('n', 'K',  '<cmd>Lspsaga hover_doc<cr>', mapopts)
  vim.keymap.set('n', 'go', '<cmd>Lspsaga show_line_diagnostics<cr>', mapopts)
  vim.keymap.set('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', mapopts)
  vim.keymap.set('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', mapopts)
  vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', mapopts)
  vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', mapopts)
  vim.keymap.set('x', '<leader>ca', ':<c-u>Lspsaga range_code_action<cr>', mapopts)
end

return {
  { 'williamboman/mason.nvim', config = true },

  { 'williamboman/mason-lspconfig.nvim', config = true },

  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      for _, ls in pairs(require('mason-lspconfig').get_installed_servers()) do
        require('lspconfig')[ls].setup({ on_attach = on_attach, capabilities = capabilities })
      end
    end,
  },

  -- Autocompletion
  {
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
        experimental = { ghost_text = true },
      })
    end,
  },

  -- Snippets
  { 'L3MON4D3/LuaSnip' },

  -- Provide completions from Language Server
  { 'hrsh7th/cmp-nvim-lsp' },

  -- Show function signatures
  { 'ray-x/lsp_signature.nvim', config = true },

  -- UI for LSP actions
  {
    'nvimdev/lspsaga.nvim',
    opts = {
      lightbulb = { virtual_text = false },
      symbol_in_winbar = { enable = false },
    },
  },
}
