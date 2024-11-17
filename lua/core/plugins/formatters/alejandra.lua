return function()
  return {
    command = "alejandra",
    args = {
      "-qq",
    },
    stdin = true,
    try_node_modules = true,
  }
end
