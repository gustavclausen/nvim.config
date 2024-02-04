return {
  "mhartington/formatter.nvim",
  config = function()
    local settings = require("core.settings")

    local filetypes = {
      ["*"] = {
        require("formatter.filetypes.any").remove_trailing_whitespace,
      },
    }

    for _, lan in pairs(settings.languages) do
      if lan.formatter_config ~= nil and lan.filetype ~= nil then
        filetypes[lan.filetype] = lan.formatter_config()
      end
    end

    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = filetypes,
    })
  end,
}
