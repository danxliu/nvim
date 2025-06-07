return {
  'saghen/blink.cmp',
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
  },
  opts = {
    snippets = {
      expand = function(snippet)
        require('luasnip.loaders.from_vscode').lazy_load()
        require('luasnip.loaders.from_vscode').lazy_load({
          paths = '~/.config/nvim/snippets',
        })
        require('luasnip').lsp_expand(snippet)
      end
    },
    keymap = { preset = 'super-tab' },
    appearance = {
      nerd_font_variant = 'normal'
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
