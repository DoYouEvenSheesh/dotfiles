return {
  "nvim-java/nvim-java",
  config = function()
    -- require('java').setup()
    vim.keymap.set('n', '<leader>jr', ':JavaRunnerRunMain<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>js', ':JavaRunnerStopMain<CR>', { noremap = true, silent = true })
  end
}
