return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = LazyVim.config.icons

      vim.o.laststatus = vim.g.lualine_laststatus

      local opts = {
        options = {
          theme = "auto",
          component_separators = "",
          section_separators = "",
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {},
          lualine_c = {
            LazyVim.lualine.root_dir(),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { LazyVim.lualine.pretty_path() },
          },
          lualine_x = {
            Snacks.profiler.status(),
            {
              function()
                ---@diagnostic disable-next-line: undefined-field
                return require("noice").api.status.command.get()
              end,
              cond = function()
                ---@diagnostic disable-next-line: undefined-field
                return package.loaded["noice"] and require("noice").api.status.command.has()
              end,
              color = function()
                return { fg = Snacks.util.color("Statement") }
              end,
            },
            {
              function()
                ---@diagnostic disable-next-line: undefined-field
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                ---@diagnostic disable-next-line: undefined-field
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = function()
                return { fg = Snacks.util.color("Constant") }
              end,
            },
            {
              function()
                return "  " .. require("dap").status()
              end,
              cond = function()
                return package.loaded["dap"] and require("dap").status() ~= ""
              end,
              color = function()
                return { fg = Snacks.util.color("Debug") }
              end,
            },
          },
          lualine_y = {
            { "progress", padding = { left = 1, right = 1 } },
          },
        },
        extensions = { "neo-tree", "lazy", "fzf" },
      }

      return opts
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    config = function()
      require("window-picker").setup({
        include_current_win = false,
      })
    end,
  },
}
