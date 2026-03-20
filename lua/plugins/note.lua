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
    -- Create an autocmd to start treesitter on each markdown buffer
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        desc = "Activate treesitter for markdown file",
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
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
