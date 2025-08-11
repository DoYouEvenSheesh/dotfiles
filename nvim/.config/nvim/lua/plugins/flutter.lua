return {
  'nvim-flutter/flutter-tools.nvim',
  ft = { 'dart' },
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },

  config = function()
    require("flutter-tools").setup {}
    vim.keymap.set('n', '<leader>fl', ':FlutterRun<CR>', { noremap = true, silent = true })
  end
}
