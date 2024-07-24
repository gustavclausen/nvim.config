local settings = require("core.settings")

local treesitter_languages = {}

for _, lan in pairs(settings.languages) do
  if not (lan.treesitter == nil) then
    table.insert(treesitter_languages, lan.treesitter)
  end
end

table.insert(treesitter_languages, "vim")
table.insert(treesitter_languages, "vimdoc")

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  lazy = false,
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = treesitter_languages,
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      autotag = { enable = true },
      auto_install = true,
    })

    require("nvim-ts-autotag").setup()
  end,
}
