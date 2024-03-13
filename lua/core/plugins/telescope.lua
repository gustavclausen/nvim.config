return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.4",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "gustavclausen/telescope-project.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      extensions = {
        require("telescope.themes").get_dropdown({}),
        project = {
          base_dirs = {
            "~/dev",
          },
          hidden_files = true,
          theme = "dropdown",
        },
        file_browser = {
          hijack_netrw = true,
          hidden = { file_browser = true, folder_browser = true },
        },
      },
      defaults = {
        file_ignore_patterns = { ".git/" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-h>"] = "which_key",
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function(opts)
            return { "--hidden" }
          end,
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("project")
    telescope.load_extension("ui-select")
    telescope.load_extension("file_browser")
  end,
}
