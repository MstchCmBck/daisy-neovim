-- Helper function to create vim keymaps
---@param keys string The key combination (e.g., '<leader>wf')
---@param func string|function The command or lua function to execute
---@param dsc string The description for the keymap (used in which-key, etc.)
---@param mode? string|string[] The mode(s) for the mapping (default: 'n')
---@param noremap? boolean Whether to use non-recursive mapping (default: nil)
local map = function(keys, func, dsc, mode, noremap)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = dsc, noremap = noremap })
end

-- Shortcut that works wiht Vanilla NVim
map("<leader>pv", vim.cmd.Ex, "Find file (netrw)")
map("<leader><space>x", "<cmd>source %<CR>", "Source file")
map("<leader>x", ":.lua<CR>", "Source line")
map("<leader>x", ":lua<CR>", "Source selection", "v")
map("<C-space>", "<C-x><C-o>", "Auto-complete", "i")
map("<leader>tt", [[<C-\><C-n>]], "Enter normal mode in terminal", "t", true)

-- Use Meta key to move lines
-- Normal mode
map("<M-Up>", ":m .-2<CR>==", "Move selection up")
map("<M-Down>", ":m .+1<CR>==", "Move selection down")
-- Visual mode
map("<M-Up>", ":m '<-2<CR>gv=gv", "Move selection up")
map("<M-Down>", ":m '>+1<CR>gv=gv", "Move selection down")

-- Shortcut that works with plugins
map("do", require("mini.diff").toggle_overlay, "Show git diff")

