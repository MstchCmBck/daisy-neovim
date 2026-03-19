return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-mini/mini.icons',
    },
    ft = 'markdown',
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "echaya/neowiki.nvim",
    ft = 'markdown',
    opts = {
      wiki_dirs = {
        { name = "Work", path = vim.fn.expand("~/Documents/Notes/Work") },
        { name = "Personal", path = vim.fn.expand("~/Documents/Notes/Perso") },
      }
    },
    keys = {
      { "<leader>ww", function() require('neowiki').open_wiki() end, desc = "Open Wiki" },
    },
  }
}
