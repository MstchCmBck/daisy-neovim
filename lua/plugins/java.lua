return {
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    ft = "java",
    config = function()
      local jdtls = require("jdtls")

      local lsp_config = {
        name = "jdtls",
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
      }

      jdtls.start_or_attach(lsp_config)
    end,
  },
  {
    "microsoft/java-debug",
    ft = "java",
  },
}

