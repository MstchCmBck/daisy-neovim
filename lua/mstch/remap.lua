vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Find file (netrw)" })
vim.keymap.set("n", "<leader><space>x", "<cmd>source %<CR>", { desc = "Source file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Source line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Source selection" })

-- Shortcut for Snacks picker
vim.keymap.set("n", "<leader>,", Snacks.picker.pickers, { desc = "Open picker" })
vim.keymap.set("n", "<leader>pf", Snacks.picker.files, { desc = "Find file" })
vim.keymap.set("n", "<C-p>", Snacks.picker.git_files, { desc = "Find file (git)" })
vim.keymap.set("n", "<leader>/", Snacks.picker.grep, { desc = "Grep search" })
vim.keymap.set("n", "<leader>e", Snacks.explorer.open, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>g", Snacks.lazygit.open, { desc = "Git" })
vim.keymap.set("n", "<leader>b", Snacks.picker.buffers, { desc = "Buffer" })

-- Shortcut for Snacks dashboard
vim.keymap.set("n", "<leader>w", Snacks.dashboard.open, { desc = "Welcome"})

