vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Shortcut for Snacks picker
vim.keymap.set("n", "<leader>,", function() Snacks.picker() end)
vim.keymap.set("n", "<C-p>", Snacks.picker.files)
vim.keymap.set("n", "<leader>/", Snacks.picker.grep)
-- vim.keymap.set("n", "<leader>e", Snacks.explorer)

