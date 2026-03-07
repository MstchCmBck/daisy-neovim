-- Configuration specific to java

local jdtls = require("jdtls")

local capabilities = require('blink.cmp').get_lsp_capabilities()

local bundles = {
  vim.fn.glob("~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true)
}
local extra = vim.fn.glob("~/.local/share/nvim/mason/packages/java-test/extension/server/*", true, true)
vim.list_extend(bundles, extra)

local config = {
  name = "jdtls",
  cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "gradlew.bat", ".git" }, { upward = true })[1]),
  capabilities = capabilities,

  init_options = {
    bundles = bundles
  },
}

require("jdtls").start_or_attach(config)

vim.keymap.set("n", "<leader>tc", jdtls.test_class, { desc = "Test class" })
vim.keymap.set("n", "<leader>tm", jdtls.test_nearest_method, { desc = "Test method" })
