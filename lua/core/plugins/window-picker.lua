return {
  "s1n7ax/nvim-window-picker",
  config = function()
    require("window-picker").setup({
      include_current_win = false,
    })
  end,
}
