local settings = require("core.settings")

if settings.theme == "catppuccin" then
  return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("core.plugins.themes.catppuccin")
    end,
  }
elseif settings.theme == "onedark" then
  return {
    "navarasu/onedark.nvim",
    config = function()
      require("core.plugins.themes.onedark")
    end,
  }
elseif settings.theme == "github" then
  return {
    "projekt0n/github-nvim-theme",
    config = function()
      require("core.plugins.themes.github")
    end,
  }
else
  return {}
end
