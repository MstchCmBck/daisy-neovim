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

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "Briefly highlight yanked text",
    callback = function() vim.hl.on_yank() end
})

-- Require plugins catppucin
vim.cmd.colorscheme "catppuccin-frappe"
require("mini.icons").setup()
