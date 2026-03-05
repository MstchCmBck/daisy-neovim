return {
  {
    "folke/snacks.nvim",
    enable = true,
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      lazygit = { enabled = true },
      terminal = { enabled = true },
    },
    keys = {
      -- Snacks picker shortcut
      { "<leader>,", function() Snacks.picker.pickers() end, desc = "Open picker"},
      { "<leader>pf", function() Snacks.picker.files() end, desc = "Find file" },
      { "<C-p>", function() Snacks.picker.git_files() end, desc = "Find file (git" },
      { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep search" },
      { "<leader>e", function() Snacks.explorer.open() end, desc = "File Explorer" },
      { "<leader>gg", function() Snacks.lazygit.open() end, desc = "Git" },
      { "<S-Tab>", function() Snacks.picker.buffers() end, desc = "Buffer" },
      { "<leader>xx", function() Snacks.picker.diagnostics() end, desc = "List diagnostics" },
      -- Snacks dashboard shortcut
      { "<leader>w", function() Snacks.dashboard.open() end, desc = "Welcome"},
      -- Snacks terminal shortcut
      { "<leader>tt", function() Snacks.terminal.toggle() end, desc = "Toggle terminal" },
    }
  }
}
