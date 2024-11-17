return {
  "stevearc/conform.nvim",
  config = function()
    local settings = require("core.settings")

    local filetypes = {
      ["_"] = { "trim_whitespace" },
    }
    local formatters = {}

    for _, lan in pairs(settings.languages) do
      if lan.formatters ~= nil and lan.filetype ~= nil then
        filetypes[lan.filetype] = lan.formatters
      end
    end

    for formatter, f_config in pairs(settings.formatters) do
      formatters[formatter] = f_config()
    end

    require("conform").setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      formatters_by_ft = filetypes,
      formatters = formatters,
      default_format_opts = {
        lsp_format = "fallback",
      },
    })
  end,
}
