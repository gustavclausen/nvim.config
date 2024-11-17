return function()
  return {
    command = "prettier",
    args = {
      "--stdin-filepath",
      vim.api.nvim_buf_get_name(0),
      "--config-precedence",
      "file-override",
      "--prose-wrap",
      "always",
    },
    stdin = true,
    try_node_modules = true,
  }
end
