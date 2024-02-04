return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      pre_save_cmds = {
        function()
          require("neo-tree.sources.manager").close_all()
        end,
      },
      bypass_session_save_file_types = { "neo-tree" },
      post_restore_cmds = {
        "Neotree reveal",
      },
      auto_session_suppress_dirs = { "~/", "/" },
      log_level = "error",
    })
  end,
}
