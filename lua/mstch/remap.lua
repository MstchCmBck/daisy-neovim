-- Helper function to create vim keymaps
---@param keys string The key combination (e.g., '<leader>wf')
---@param func string|function The command or lua function to execute
---@param dsc string The description for the keymap (used in which-key, etc.)
---@param mode? string|string[] The mode(s) for the mapping (default: 'n')
local map = function(keys, func, dsc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = dsc, silent = true })
end

-- Those shortcut needs to be usable whithout map function
vim.keymap.set("n", "<leader>x", ":.lua<CR>", {desc = "Source line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Source selection" })

-- Shortcut that works wiht Vanilla NVim
map("<C-BS>", "<C-w>", "Delete word in insert mode", { "i", "c" })
map("<C-H>", "<C-w>", "Delete word in insert mode", { "i", "c" })
map("<leader><space>x", "<cmd>source %<CR>", "Source file")
map("<leader>pv", vim.cmd.Ex, "Find file (netrw)")
map("<C-space>", "<C-x><C-o>", "Auto-complete", "i")

-- Terminal mode mappings
-- Use <C-e> to escape terminal mode (works in all terminal types)
map("<C-e>", [[<C-\><C-n>]], "Enter normal mode in terminal", "t")
-- Disable leader key in terminal mode to prevent space from being interpreted as leader
map("<Space>", "<Space>", "Insert space in terminal", "t")

-- Use Meta key to move lines
-- Normal mode
map("<M-Up>", ":m .-2<CR>==", "Move selection up", "n")
map("<M-Down>", ":m .+1<CR>==", "Move selection down", "n")
-- Visual mode
map("<M-Up>", ":m '<-2<CR>gv=gv", "Move selection up", "v")
map("<M-Down>", ":m '>+1<CR>gv=gv", "Move selection down", "v")

-- Resize windows
map("<C-w><left>", "<C-w><", "Decrease width", "n")
map("<C-w><right>", "<C-w>>", "Increase width", "n")
map("<C-w><up>", "<C-w>+", "Increase height", "n")
map("<C-w><down>", "<C-w>-", "Decrease height", "n")

-- Shortcut that works with plugins
map("do", require("mini.diff").toggle_overlay, "Show git diff")

