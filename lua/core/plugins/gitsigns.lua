return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("gitsigns").setup({
      on_attach = function()
        local wk = require("which-key")
        local gs = package.loaded.gitsigns

        wk.add({
          { "<leader>mgB", gs.blame_line, desc = "Show line blame", silent = true, noremap = true },
          { "<leader>mgb", gs.toggle_current_line_blame, desc = "Toggle line blame", silent = true, noremap = true },
        })
      end,
    })
  end,
}
