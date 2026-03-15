return {
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    event = "VeryLazy",
    config = function()
      local jdtls = require("jdtls")

      local lsp_config = {
        name = "nvim-jdtls",
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
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
  {
    "microsoft/java-debug",
    ft = "java",
  },
}

