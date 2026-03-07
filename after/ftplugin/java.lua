-- Configuration specific to java

local jdtls = require("jdtls")

local capabilities = require('blink.cmp').get_lsp_capabilities()

local bundles = {
  vim.fn.glob("~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true)
}

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
