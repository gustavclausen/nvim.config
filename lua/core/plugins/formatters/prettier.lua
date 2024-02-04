local formatter_util = require("formatter.util")

return function()
  return {
    exe = "prettier",
    args = {
      "--stdin-filepath",
      formatter_util.escape_path(formatter_util.get_current_buffer_file_path()),
      "--config-precedence",
      "file-override",
      "--prose-wrap",
      "always",
    },
    stdin = true,
    try_node_modules = true,
  }
end
