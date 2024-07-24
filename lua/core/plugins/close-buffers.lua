return {
  "kazhala/close-buffers.nvim",
  config = function()
    require("close_buffers").setup({})

    local wk = require("which-key")

    wk.add({
      {
        "<leader>bd",
        "<cmd>lua require('close_buffers').delete({ type = 'hidden' })<CR>",
        desc = "Close hidden buffers",
        silent = true,
        noremap = true,
      },
    })
  end,
}
