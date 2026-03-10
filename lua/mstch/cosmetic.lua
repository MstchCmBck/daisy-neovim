-- Only cosmetic changes

vim.termguicolors = true

-- Status bar (bottom ), winbar (top) and column (left)
-- Having just one status bar
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
-- Top winbar display file name
vim.opt.winbar = "%f %m"
-- Keep status column the same width
vim.opt.signcolumn = "yes:2"
vim.opt.winborder = "rounded"

-- Set separation line purple and customize winbar
require("catppuccin").setup({
  custom_highlights = function(colors)
    return {
      WinSeparator = { fg = colors.mauve, style = { "bold" } },
      -- WinBar background customization
      WinBar = { bg = colors.surface1, fg = colors.text },
      WinBarNC = { bg = colors.surface0, fg = colors.overlay0 },
    }
  end
})
-- Apply colorscheme after setup
vim.cmd.colorscheme "catppuccin-macchiato"

-- Change diagnostic icons
local severity = vim.diagnostic.severity
vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
})
