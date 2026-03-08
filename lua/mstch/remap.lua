-- Shortcut that works wiht Vanilla NVim
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Find file (netrw)" })
vim.keymap.set("n", "<leader><space>x", "<cmd>source %<CR>", { desc = "Source file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Source line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Source selection" })
vim.keymap.set("i", "<C-space>", "<C-x><C-o>", { desc = "Auto-complete" })
vim.keymap.set("t", "<leader>tt", [[<C-\><C-n>]], { noremap = true, desc = "Enter normal mode in terminal" })

-- Use Meta key to move lines
-- Normal mode
vim.keymap.set("n", "<M-Up>", ":m .-2<CR>==", { desc = "Move selection up" })
vim.keymap.set("n", "<M-Down>", ":m .+1<CR>==", { desc = "Move selection down" })
-- Visual mode
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- Shortcut that works with plugins
vim.keymap.set("n", "do", require("mini.diff").toggle_overlay, { desc = "Show git diff" })

