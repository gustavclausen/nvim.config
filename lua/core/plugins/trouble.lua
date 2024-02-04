return {
  "folke/trouble.nvim",
  dependencies = {
    "folke/lsp-colors.nvim",
  },
  config = function()
    require("lsp-colors").setup()
    require("trouble").setup()
  end,
}
