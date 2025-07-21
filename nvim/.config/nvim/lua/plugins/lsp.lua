return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    version = "^2.0.0", -- pin to v2 or remove to always stay latest
    dependencies = {
      "saghen/blink.cmp",
      "ziglang/zig.vim",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls", "rust_analyzer", "gopls",
          "html", "cssls", "basedpyright", "clangd", "zls",
        },
        automatic_installation = true, -- optional
        automatic_enable = true,       -- auto-enable installed servers (default in v2)
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- General setup for all servers
      for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
        if server_name ~= "zls" then
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end
      end

      -- Custom zls setup
      lspconfig.zls.setup({
        root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
        capabilities = capabilities,
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

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

          if c.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
              end,
            })
          end
        end,
      })
    end,
  },
}
