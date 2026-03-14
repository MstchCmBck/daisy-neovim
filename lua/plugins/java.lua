return {
  {
    "mfussenegger/nvim-jdtls",
    version = false,
    dependencies = {
      "mfussenegger/nvim-dap",
      "neovim/nvim-lspconfig",
    },
    ft = "java",
    config = function()
      -- Java LSP configuration using jdtls
      local jdtls = require("jdtls")

      -- This path should work for both Unix-like and Windows
      local mason_folder = vim.fn.stdpath("data") .. "/mason"

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local bundles = {
        vim.fn.glob(mason_folder .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true)
      }
      local extra = vim.fn.glob(mason_folder .. "/packages/java-test/extension/server/*", true, true)
      vim.list_extend(bundles, extra)
      local config = {
        name = "jdtls",
        cmd = { vim.fn.expand(mason_folder .. "/bin/jdtls") },
        root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "gradlew.bat", ".git" }, { upward = true })[1]),
        capabilities = capabilities,
        init_options = {
          bundles = bundles
        },
      }
      -- Start or attach jdtls
      jdtls.start_or_attach(config)
      -- Java-specific keybindings
      vim.keymap.set("n", "<leader>tc", jdtls.test_class, { desc = "Test class" })
      vim.keymap.set("n", "<leader>tm", jdtls.test_nearest_method, { desc = "Test method" })
    end
  },

  {
    "microsoft/java-debug",
    ft = "java"
  }
}
