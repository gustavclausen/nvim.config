return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        disabled_filetypes = { "neo-tree" },
      },
      sections = {
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = {
              modified = "●",
            },
          },
        },
        lualine_x = { "filetype" },
      },
    })
  end,
}
