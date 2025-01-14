return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "b0o/SchemaStore.nvim",
  },
  config = function()
    local lspconfig = require "lspconfig"

    local capabilities = require "capabilities"

    require("mason-lspconfig").setup {
      handlers = {
        function(server)
          lspconfig[server].setup { capabilities = capabilities }
        end,

        rust_analyzer = function() end,
        jdtls = function() end,
        tsserver = function() end,

        lua_ls = function()
          lspconfig.lua_ls.setup {
            on_attach = function(client, bufnr)
              client.server_capabilities.documentFormattingProvider = false
            end,
            capabilities = capabilities,
            settings = {
              Lua = {
                hint = {
                  enable = true,
                  setType = true,
                },
                codeLens = {
                  enable = true,
                },
                completion = {
                  callSnippet = "Replace",
                  postfix = ".",
                  showWord = "Disable",
                  workspaceWord = false,
                },
              },
            },
          }
        end,

        volar = function()
          lspconfig.volar.setup {
            on_attach = function(client, bufnr)
              client.server_capabilities.documentFormattingProvider = false
            end,
            capabilities = capabilities,
          }
        end,

        jsonls = function()
          lspconfig.jsonls.setup {
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              },
            },
            on_attach = function(client, bufnr)
              client.server_capabilities.documentFormattingProvider = false
            end,
            capabilities = capabilities,
          }
        end,

        yamlls = function()
          lspconfig.yamlls.setup {
            capabilities = capabilities,
            settings = {
              yaml = {
                keyOrdering = false,
                schemaStore = {
                  enable = false,
                  url = "",
                },
                schemas = require("schemastore").yaml.schemas(),
              },
            },
          }
        end,
      },
    }
  end,
}
