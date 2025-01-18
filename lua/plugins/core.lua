return {
  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
      indent = {
        animate = {
          enabled = false,
        },
      },
      dashboard = { enabled = false },
      lazygit = {
        configure = false,
      },
      terminal = { enabled = true },
    },
    keys = {
      {
        "<leader>tt",
        function()
          Snacks.terminal()
        end,
        desc = "Toggle Terminal",
      },
    },
  },
  {
    "numToStr/Navigator.nvim",
    keys = {
      { "<C-h>", mode = { "n", "t" }, "<CMD>NavigatorLeft<CR>" },
      { "<C-l>", mode = { "n", "t" }, "<CMD>NavigatorRight<CR>" },
      { "<C-k>", mode = { "n", "t" }, "<CMD>NavigatorUp<CR>" },
      { "<C-j>", mode = { "n", "t" }, "<CMD>NavigatorDown<CR>" },
      { "<C-p>", mode = { "n", "t" }, "<CMD>NavigatorPrevious<CR>" },
    },
    config = function()
      ---@diagnostic disable-next-line: missing-parameter
      require("Navigator").setup()
    end,
  },
  {
    "folke/persistence.nvim",
    enabled = false,
  },
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        auto_session_suppress_dirs = { "~/", "/" },
        log_level = "error",
      })
    end,
  },
}
