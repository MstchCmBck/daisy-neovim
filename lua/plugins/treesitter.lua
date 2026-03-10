return {
  {
    "nvim-treesitter/nvim-treesitter",

    -- Called when a change in treesitter config occurs
    build = ":TSUpdate",
    lazy = false,
    opts = {
      ensure_installed = {
        "lua", "vim", "java", "python", "go", "gomod", "gosum", "gowork",
      },
      -- Enable syntax highlighting
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      -- Enable indentation based on treesitter
      indent = {
        enable = true
      }
    }
  }
}
