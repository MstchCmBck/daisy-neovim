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
      vim.notify("Loading Java LSP configuration...", vim.log.levels.INFO)

      local ok, jdtls = pcall(require, "jdtls")
      if not ok then
        vim.notify("Failed to load jdtls: " .. jdtls, vim.log.levels.ERROR)
        return
      end

      -- This path should work for both Unix-like and Windows
      local mason_folder = vim.fn.stdpath("data") .. "/mason"

      -- Validate Mason installation
      if vim.fn.empty(vim.fn.glob(mason_folder)) > 0 then
        vim.notify("Mason not found at: " .. mason_folder, vim.log.levels.ERROR)
        return
      end

      -- Get capabilities with error handling
      local capabilities = {}
      local ok_cmp, cmp = pcall(require, 'blink.cmp')
      if ok_cmp then
        capabilities = cmp.get_lsp_capabilities()
      else
        vim.notify("blink.cmp not found, using default capabilities", vim.log.levels.WARN)
      end

      -- Configure bundles for debugging and testing
      local bundles = {
        vim.fn.glob(mason_folder .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true)
      }
      local extra = vim.fn.glob(mason_folder .. "/packages/java-test/extension/server/*", true, true)
      vim.list_extend(bundles, extra)

      -- Enhanced configuration with proper settings
      local config = {
        name = "jdtls",
        cmd = { vim.fn.expand(mason_folder .. "/bin/jdtls") },
        root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "gradlew.bat", ".git" }, { upward = true })[1]),
        capabilities = capabilities,
        init_options = {
          bundles = bundles
        },
        settings = {
          java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
            completion = {
              favoriteStaticMembers = {
                "org.junit.Assert.*",
                "org.junit.Assume.*",
                "org.junit.jupiter.api.Assertions.*",
                "org.junit.jupiter.api.Assumptions.*",
                "org.mockito.Mockito.*",
                "org.mockito.ArgumentMatchers.*",
                "org.mockito.Answers.*"
              }
            },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999
              }
            },
            codeGeneration = {
              toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
              }
            }
          }
        }
      }

      -- Start or attach jdtls with error handling
      local success, err = pcall(jdtls.start_or_attach, config)
      if not success then
        vim.notify("Failed to start jdtls: " .. err, vim.log.levels.ERROR)
      else
        vim.notify("jdtls started successfully", vim.log.levels.INFO)
      end

      -- Set up keybindings for current buffer only
      local function set_java_keymaps()
        local bufnr = vim.api.nvim_get_current_buf()
        vim.keymap.set("n", "<leader>tc", function() jdtls.test_class() end, { buffer = bufnr, desc = "Test class" })
        vim.keymap.set("n", "<leader>tm", function() jdtls.test_nearest_method() end, { buffer = bufnr, desc = "Test method" })
        vim.keymap.set("n", "<leader>to", function() jdtls.organize_imports() end, { buffer = bufnr, desc = "Organize imports" })
        vim.keymap.set("v", "<leader>ev", function() jdtls.extract_variable() end, { buffer = bufnr, desc = "Extract variable" })
        vim.keymap.set("v", "<leader>em", function() jdtls.extract_method() end, { buffer = bufnr, desc = "Extract method" })
      end

      -- Set keybindings for current buffer
      set_java_keymaps()

      -- Also set up autocmd for future Java buffers
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function(args)
          -- Set keybindings for new Java buffers
          vim.schedule(function()
            local bufnr = args.buf
            vim.keymap.set("n", "<leader>tc", function() jdtls.test_class() end, { buffer = bufnr, desc = "Test class" })
            vim.keymap.set("n", "<leader>tm", function() jdtls.test_nearest_method() end, { buffer = bufnr, desc = "Test method" })
            vim.keymap.set("n", "<leader>to", function() jdtls.organize_imports() end, { buffer = bufnr, desc = "Organize imports" })
            vim.keymap.set("v", "<leader>ev", function() jdtls.extract_variable() end, { buffer = bufnr, desc = "Extract variable" })
            vim.keymap.set("v", "<leader>em", function() jdtls.extract_method() end, { buffer = bufnr, desc = "Extract method" })
          end)
        end,
        desc = "Set Java keybindings for new buffers"
      })
    end
  },
  {
    "microsoft/java-debug",
    ft = "java"
  }
}
