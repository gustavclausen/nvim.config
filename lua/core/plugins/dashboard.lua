return {
  "glepnir/dashboard-nvim",
  commit = "f7d623457d6621b25a1292b24e366fae40cb79ab",
  config = function()
    local dashboard = require("dashboard")

    dashboard.custom_header = {
      "",
      "༼ つ ▀_▀ ༽つ",
      "",
      " Let's go!  ",
      "",
    }
    dashboard.custom_center = {
      {
        icon = "  ",
        desc = "New buffer               ",
        action = "new",
      },
      {

        icon = "  ",
        desc = "Find file                ",
        action = "Telescope find_files find_command=rg,--hidden,--files",
      },
      {
        icon = "  ",
        desc = "Recently opened files    ",
        action = "Telescope oldfiles",
      },
    }
    dashboard.custom_footer = nil
  end,
}
