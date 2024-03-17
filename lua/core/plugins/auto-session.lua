return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      auto_session_suppress_dirs = { "~/", "/" },
      log_level = "error",
    })
  end,
}
