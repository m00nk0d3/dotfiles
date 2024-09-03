return {
  'williamboman/mason.nvim',
  cmd = 'Mason',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'jay-babu/mason-null-ls.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  opts = {
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  },
}
