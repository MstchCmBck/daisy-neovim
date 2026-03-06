return {
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },
      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },

    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Special Lua Config, as recommended by neovim help docs
      vim.lsp.config('lua_ls', require('plugins.lsp.lua'))
      vim.lsp.enable 'lua_ls'
    end,
  },
}
