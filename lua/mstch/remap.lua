-- Shortcut that works wiht Vanilla NVim
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Find file (netrw)" })
vim.keymap.set("n", "<leader><space>x", "<cmd>source %<CR>", { desc = "Source file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Source line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Source selection" })
vim.keymap.set("i", "<C-space>", "<C-x><C-o>", { desc = "Auto-complete" })

-- Shortcut to show git diff
vim.keymap.set("n", "do", MiniDiff.toggle_overlay, { desc = "Show git diff" })

