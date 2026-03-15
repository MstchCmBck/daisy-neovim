return {
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
      "microsoft/java-debug",
    },
    event = "VeryLazy",
    config = function()
      local jdtls = require("jdtls")
      local mason_folder = vim.fn.stdpath("data") .. "/mason"

      -- Gather all *jar used to debug
      local bundles = {
        vim.fn.glob(mason_folder .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true)
      }
      local extra = vim.fn.glob(mason_folder .. "/packages/java-test/extension/server/*", true, true)
      vim.list_extend(bundles, extra)

      local lsp_config = {
        name = "nvim-jdtls",
        cmd = { mason_folder .. "/bin/jdtls" },

        -- Add JDTLS plugins
        init_options = {
          bundles = bundles,
        }
      }

      vim.api.nvim_create_autocmd("FileType", {
        desc = "Attach each java buffer to jdtls",
        pattern = "java",
        callback = function()
          jdtls.start_or_attach(lsp_config)
        end
      })
    end,
  },
}

