-- Common NVim configuration

-- Status Column config
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Highlight things ...
vim.opt.incsearch = true
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Briefly highlight yanked text",
  callback = function() vim.hl.on_yank() end
})

-- Small nice improvments
vim.opt.cursorline = true
vim.termguicolors = true
vim.opt.scrolloff = 12
vim.opt.updatetime = 250
-- Having just one status bar
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
-- Don't generate comment when using 'o' or 'O'.
vim.opt.formatoptions:remove{ "o", "/" }
-- Display unprintable
vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '·', space = '·' }
-- Keep status column the same width
vim.opt.signcolumn = "yes:2"
-- Load project specific config
vim.opt.exrc = true
-- Update buffer when modify outside of neovim
vim.opt.autoread = true

-- Fold text
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 5

-- Reduce scroll wheel sensitivity
vim.keymap.set({'n', 'v', 's'}, '<ScrollWheelUp>', '<C-y>')
vim.keymap.set({'n', 'v', 's'}, '<ScrollWheelDown>', '<C-e>')

vim.api.nvim_create_autocmd("FileType", {
  desc = "Open help in a vertical split help",
  pattern = "help",
  callback = function()
    vim.cmd("wincmd L")
  end
})

-- Require plugins catppucin
vim.cmd.colorscheme "catppuccin-macchiato"
-- Set separation line purple
require("catppuccin").setup({
    custom_highlights = function(colors)
        return {
            WinSeparator = { fg = colors.mauve, style = { "bold" } },
        }
    end
})

-- Diagnostics related
vim.api.nvim_create_autocmd("CursorHold", {
  desc = "Display diagnostic when cursor hold",
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

