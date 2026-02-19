vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Shortcut for Snacks picker
vim.keymap.set("n", "<leader>,", Snacks.picker.pickers)
vim.keymap.set("n", "<C-p>", Snacks.picker.files)
vim.keymap.set("n", "<leader>/", Snacks.picker.grep)
vim.keymap.set("n", "<leader>e", Snacks.explorer.open)

vim.keymap.set("n", "<leader>gg", Snacks.lazygit.open)

