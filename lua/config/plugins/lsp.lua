return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },

    opts = {
      servers = {
        lua_ls = {},
        ts_ls = {},
        rust_analyzer = {
          cmd = {
            "rustup", "run", "stable", "rust-analyzer"
          }
        },
        clangd = {},
        gopls = {
          { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
        },
      }
    },

    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting', 0) then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end
            })
          end
        end,
      })

      -- mappings
      vim.keymap.set("n", "gra", ":lua vim.lsp.buf.code_action()<CR>")
      vim.keymap.set("n", "grr", ":lua vim.lsp.buf.rename()<CR>")
      vim.keymap.set("n", "gdf", ":lua vim.lsp.buf.definition()<CR>")
      vim.keymap.set("n", "grf", ":lua vim.lsp.buf.references()<CR>")
      vim.keymap.set("n", "gdc", ":lua vim.lsp.buf.declaration()<CR>")
      vim.keymap.set("n", "gdi", ":lua vim.lsp.buf.implementation()<CR>")
      vim.keymap.set("n", "sh", ":lua vim.lsp.buf.signature_help()<CR>")
    end,
  }
}
