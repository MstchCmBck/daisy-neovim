-- Configuration specific to java

local capabilities = require('blink.cmp').get_lsp_capabilities()

local config = {
  name = "jdtls",
  cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "gradlew.bat", ".git" }, { upward = true })[1]),
  capabilities = capabilities,
}

require("jdtls").start_or_attach(config)
