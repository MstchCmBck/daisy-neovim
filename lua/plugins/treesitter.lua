return {
  {
    "nvim-treesitter/nvim-treesitter",

    -- Called when a change in treesitter config occurs
    build = ":TSUpdate",
    lazy = false,
    opts = {
      ensure_installed = {
        "lua",
        "luadoc",
        "vim",
        "java",
        "python",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "markdown",
        "markdown_inline",
        "html",
        "javascript",
        "typescript",
        "json",
        "css",
        "javascript",
        "jsdoc",
      },
      -- Enable syntax highlighting
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      -- Enable indentation based on treesitter
      indent = {
        enable = true,
      },
    },
  },
}
