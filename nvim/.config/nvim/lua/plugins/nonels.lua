return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  config = function()
    null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.golines,
        -- null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.black,
      }
    })
  end
}
