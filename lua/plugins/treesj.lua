return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  keys = {
    { "<leader>m", function() require("treesj").toggle() end, desc = "Toggle arguments split (TreeSJ)" },
  },
  opts = {},
}
