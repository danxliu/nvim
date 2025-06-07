return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    { "williamboman/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
    "saghen/blink.cmp",
  },
  opts = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    return {
      ensure_installed = {
        -- lua stuff
        "lua_ls",

        -- web dev stuff
        "cssls",
        "html",
        "emmet_ls",
        "denols",

        -- c/cpp stuff
        "clangd",

        -- custom
        "rust_analyzer",
        "texlab",
        "ltex",
        "marksman",
        "pyright"
      },
      handlers = {
        function(server)
          require("lspconfig")[server].setup {
            capabilities = capabilities
          }
        end
      }
    }
  end
}
