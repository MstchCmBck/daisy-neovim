-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-mini/mini.icons", version = false, opts = {} },
    { "nvim-mini/mini.diff", version = false, opts = {} },
    { "nvim-mini/mini.statusline", version = false, opts = {} },
    { "nvim-mini/mini.bracketed", version = false, opts = {} },
    { "nvim-mini/mini.surround", version = false, opts = {} },
    { "nvim-mini/mini.ai", version = false, opts = {} },
    { "nvim-mini/mini.completion", version = false, opts = {} },
    { "folke/which-key.nvim", version = false, opts = {} },
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- automatically check for plugin updates
  checker = { enabled = true },
})

