return {
  "mfussenegger/nvim-lint",
  config = function()
    local settings = require("core.settings")

    local filetypes = {}

    for _, lan in pairs(settings.languages) do
      if not (lan.lint_config == nil) then
        filetypes[lan.filetype] = lan.lint_config
      end
    end

    require("lint").linters_by_ft = filetypes
  end,
}
