return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    keys = {
      {
        "<F9>",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
        mode = "n",
      },
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
        mode = "n",
      },
      {
        "<S-F5>",
        function()
          require("dap").restart()
        end,
        desc = "Restart",
        mode = "n",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
        mode = "n",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
        mode = "n",
      },
      {
        "<S-F11>",
        function()
          require("dap").step_out()
        end,
        desc = "Step out",
        mode = "n",
      },
      {
        "<F4>",
        function()
          require("dapui").close()
        end,
        desc = "Exit debugger",
        mode = "n",
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- Define the highlight color (Red)
      vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermfg = 0, fg = "#993939" })
      -- Define the sign (The Big Red Dot)
      vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "DapBreakpoint",
      })
      -- Define the highlight color (Grey)
      vim.api.nvim_set_hl(0, "DapBreakpointRejected", { ctermfg = 0, fg = "#808080" })
      -- Define the sign (The Big Grey Dot)
      vim.fn.sign_define("DapBreakpointRejected", {
        text = "●",
        texthl = "DapBreakpointRejected",
        linehl = "",
        numhl = "DapBreakpointRejected",
      })
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "js-debug-adapter",
        "python-debugpy",
        "delve",
        "java-debug-adapter",
        "lua-debug-adapter",
      },
      handlers = {
        js = function(config)
          local dap = require("dap")
          local js_debug_path = vim.fn.stdpath("data")
            .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"
          dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
              command = "node",
              args = { js_debug_path, "${port}" },
            },
          }
        end,
      },
    },
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {},
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
    },
    opts = {
      strategy_config = {
        dap = {
          type = "pwa-node",
          request = "launch",
          name = "Debug Jest Tests",
          env = {
            CI = true,
          },
        },
      },
    },
    keys = {
      {
        "<leader>tt",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Test All Files",
      },
      {
        "<leader>tT",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "Test Whole Project",
      },
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Test Run",
      },
      {
        "<leader>td",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Test Debug",
      },
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last({ strategy = "dap" })
        end,
        desc = "Test Debug Last",
      },
      {
        "<leader>tk",
        function()
          require("neotest").output.open()
        end,
        desc = "Test Result",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Test Summary",
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            isTestFile = require("neotest-jest.jest-util").defaultIsTestFile,
          }),
        },
      })
    end,
  },
}
