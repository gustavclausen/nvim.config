return function()
  return {
    exe = "alejandra",
    args = {
      "-qq",
    },
    stdin = true,
    try_node_modules = true,
  }
end
