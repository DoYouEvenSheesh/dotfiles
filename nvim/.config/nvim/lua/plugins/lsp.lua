return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "saghen/blink.cmp",
      "ziglang/zig.vim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensured_installed = {
          "lua_ls", "rust_analyzer", "gopls",
          "html", "cssls", "basedpyright",
          "clangd"
        }
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require("mason-lspconfig").setup_handlers({
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({ capabilities = capabilities })
        end,

        zls = function()
          local lspconfig = require("lspconfig")
          lspconfig.zls.setup({
            root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
            settings = {
              zls = {
                enable_inlay_hints = true,
                enable_snippets = true,
                warn_style = true,
              },
            },
          })
          vim.g.zig_fmt_parse_errors = 0
          vim.g.zig_fmt_autosave = 0
        end,
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = false,
        update_in_insert = true,
        severity_sort = true,
      })
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

          if c.supports_method("textDocument/formatting") then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
              end,
            })
          end
        end,
      })
    end
  },
}
