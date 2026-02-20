vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- Shortcut for Snacks picker
vim.keymap.set("n", "<leader>,", Snacks.picker.pickers)
vim.keymap.set("n", "<leader>pf", Snacks.picker.files)
vim.keymap.set("n", "<C-p>", Snacks.picker.git_files)
vim.keymap.set("n", "<leader>/", Snacks.picker.grep)
vim.keymap.set("n", "<leader>e", Snacks.explorer.open)
vim.keymap.set("n", "<leader>gg", Snacks.lazygit.open)
vim.keymap.set("n", "<leader>b", Snacks.picker.buffers)

-- Shortcut for Snacks dashboard
vim.keymap.set("n", "<leader>w", Snacks.dashboard.open)

