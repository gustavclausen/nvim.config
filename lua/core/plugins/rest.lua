return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local rest = require("rest-nvim")
    rest.setup()
    vim.keymap.set("n", "<leader>hr", rest.run, { desc = "Send HTTP request" })
    vim.keymap.set("n", "<leader>hp", function()
      rest.run(true)
    end, { desc = "Preview HTTP request" })
    vim.keymap.set("n", "<leader>hl", function()
      rest.last()
    end, { desc = "See last HTTP request" })
  end,
}
