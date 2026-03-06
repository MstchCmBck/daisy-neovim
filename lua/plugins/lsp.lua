return {
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },
      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    -- Load plugin when LSP attaches to a buffer
    event = "LspAttach",

    -- Key mappings for LSP functionality
    keys = {
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols", mode = "n" },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP symbols (all)", mode = "n" },
      { "<F2>", function() vim.lsp.buf.rename() end, desc = "Rename", mode = "n" },
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", mode = "n" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration", mode = "n" },
      { "gr", function() Snacks.picker.lsp_references() end, desc = "Goto References", mode = "n" },
      { "gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation", mode = "n" },
    },

    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Enable the following language servers
      local servers = {
        gopls = {},
        pyright = {},
      }

      -- Ensure the servers and tools above are installed
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        -- 'lua_ls', -- Lua Language server
        'stylua', -- Used to format Lua code
        -- You can add other tools here that you want Mason to install
      })

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      for name, server in pairs(servers) do
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
      end

      -- Special Lua Config, as recommended by neovim help docs
      vim.lsp.config('lua_ls', require('plugins.lsp.lua'))
      vim.lsp.enable 'lua_ls'
    end,
  },
}
