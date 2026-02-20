-- Common NVim configuration

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.incsearch = true

vim.termguicolors = true

vim.opt.scrolloff = 12

-- Require plugins catppucin
vim.cmd.colorscheme "catppuccin-frappe"
