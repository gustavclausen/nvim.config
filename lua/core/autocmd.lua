local api = vim.api

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*",
  command = "set signcolumn=yes",
})
