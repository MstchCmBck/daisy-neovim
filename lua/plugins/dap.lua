return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim"
        },
        keys = {
            { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint", mode = "n" },
            { "<F5>", function() require("dap").continue() end, desc = "Continue", mode = "n" },
            { "<S-F5>", function() require("dap").restart() end, desc = "Restart", mode = "n" },
            { "<F10>", function() require("dap").step_over() end, desc = "Step over", mode = "n" },
            { "<F11>", function() require("dap").step_into() end, desc = "Step into", mode = "n" },
            { "<S-F11>", function() require("dap").step_out() end, desc = "Step out", mode = "n" },
            { "<F4>", function() require("dapui").close() end, desc = "Exit debugger", mode = "n" },
        },
        config = function ()
            require("mason-nvim-dap").setup()

            local dap = require "dap"
            local dapui = require "dapui"

            dapui.setup()
            dap.listeners.before.attach.dapui_config = function () dapui.open() end
            dap.listeners.before.launch.dapui_config = function () dapui.open() end
            dap.listeners.before.event_terminated.dapui_config = function () dapui.close() end
            dap.listeners.before.event_exited.dapui_config = function () dapui.close() end

            -- Define the highlight color (Red)
            vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermfg = 0, fg = '#993939' })
            -- Define the sign (The Big Red Dot)
            vim.fn.sign_define('DapBreakpoint', {
                text = '●',
                texthl = 'DapBreakpoint',
                linehl = '',
                numhl = 'DapBreakpoint'
            })
        end
    },

    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = { "mfussenegger/nvim-dap" },
        opts = {}
    }
}
