return {
    {
        "nickvandyke/opencode.nvim",
        version = "*",
        opts = {
            auto_fallback_to_embedded = false,
        },
        keys = {
            {
                "<leader>aa",
                function ()
                    require("opencode").ask()
                end,
                desc = "Ask opencode",
                mode = "n",
            },
            {
                "<leader>aa",
                function ()
                    require("opencode").ask("@selection: ")
                end,
                desc = "Ask opencode about selection",
                mode = "v",
            },
            {
                "<leader>at",
                function ()
                    require("opencode").toggle()
                end,
                desc = "Toggle opencode",
                mode = "n",
            }
        }
    }
}
