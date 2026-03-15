return {
  {
    -- Auto enable installed LSP server
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "lua_ls",
        "gopls",
        "pyright",
      },
      automatic_enable = {
        exclude = { "jdtls" }
      }
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },

  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    event = "VeryLazy",
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },
      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    config = function()
      -- No special config needed for nvim-lspconfig
      -- jdtls is handled by nvim-jdtls plugin
    end
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  }
}
