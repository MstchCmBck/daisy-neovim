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
        default = { 'lazydev','lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true }
    },
    opts_extend = { "sources.default" }
  }
}
