vim.pack.add({
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
  { src = "https://github.com/williamboman/mason.nvim" },
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/webhooked/kanso.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvimdev/dashboard-nvim" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

-- Plugin setup
require("blink.cmp").setup({
  snippets = {
    expand = function(snippet)
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip.loaders.from_vscode').lazy_load({
        paths = '~/.config/nvim/snippets',
      })
      require('luasnip').lsp_expand(snippet)
    end
  }, sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  }, fuzzy = { implementation = "lua" }
})
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "cssls",
    "html",
    "clangd",
    "pyright"
  },
  handlers = {
    function(server)
      require("lspconfig")[server].setup {
        capabilities = require("blink.cmp").get_lsp_capabilities()
      }
    end
  }
})
require("dashboard").setup({
  theme = 'doom',
  config = {
    header = {
      '',
      '   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ',
      '    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
      '          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ',
      '           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
      '          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
      '   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
      '  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
      ' ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
      ' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ',
      '      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
      '       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
      '',
    },
    center = {
      {
        desc = 'New File',
        group = 'Label',
        action = 'enew',
        key = 'n',
      },
      {
        desc = 'Update',
        group = 'Label',
        action = 'vim.pack.update()',
        key = 'u',
      },
    },
    footer = {
      "The one true text editor."
    }
  }
})
require("nvim-tree").setup()
require("mini.pick").setup()
require("kanso").setup()

vim.cmd("colorscheme kanso-zen")
