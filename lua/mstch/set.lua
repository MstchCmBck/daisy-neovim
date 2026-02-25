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
vim.opt.foldmethod = 'indent'

-- Reduce scroll wheel sensitivity
vim.keymap.set({'n', 'v', 's'}, '<ScrollWheelUp>', '<C-y>')
vim.keymap.set({'n', 'v', 's'}, '<ScrollWheelDown>', '<C-e>')

-- Require plugins catppucin
vim.cmd.colorscheme "catppuccin-macchiato"

-- Diagnostics related
vim.api.nvim_create_autocmd("CursorHold", {
    desc = "Display diagnostic when cursor hold",
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end,
})

