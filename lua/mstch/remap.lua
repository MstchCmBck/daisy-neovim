-- Shortcut that works wiht Vanilla NVim
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Find file (netrw)" })
vim.keymap.set("n", "<leader><space>x", "<cmd>source %<CR>", { desc = "Source file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Source line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Source selection" })
vim.keymap.set("i", "<C-space>", "<C-x><C-o>", { desc = "Auto-complete" })
vim.keymap.set("t", "<leader>tt", [[<C-\><C-n>]], { noremap = true, desc = "Enter normal mode in terminal" })

-- Shortcut that works with plugins
vim.keymap.set("n", "do", MiniDiff.toggle_overlay, { desc = "Show git diff" })

