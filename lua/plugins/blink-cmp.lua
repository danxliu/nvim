return {
  "saghen/blink.cmp",
  build = "cargo build --release",
  dependences = {
    "rafamadriz/friendly-snippets",
    {
      "saghen/blink.compat",
      opts = {}
    }
  },
  event = "InsertEnter",
  opts = {
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
