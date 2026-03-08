return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    event = "VeryLazy",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },
      appearance = { nerd_font_variant = 'mono' },
      completion = { documentation = { auto_show = false } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true }
    },
    opts_extend = { "sources.default" }
  }
}
