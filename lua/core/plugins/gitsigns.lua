return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("gitsigns").setup({
      on_attach = function()
        local wk = require("which-key")
        local default_options = { silent = true, noremap = true }
        local gs = package.loaded.gitsigns

        wk.register({
          B = {
            function()
              gs.blame_line()
            end,
            "Show line blame",
          },
          b = { gs.toggle_current_line_blame, "Toggle line blame" },
        }, { prefix = "<leader>mg", mode = "n", default_options })
      end,
    })
  end,
}
