local settings = require("core.settings")

local treesitter_languages = {}

for _, lan in pairs(settings.languages) do
  if not lan.treesitter == nil then
    table.insert(treesitter_languages, lan.treesitter)
  end
end

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = treesitter_languages,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      autotag = { enable = true },
      auto_install = true,
    })

    require("nvim-ts-autotag").setup()
  end,
}
