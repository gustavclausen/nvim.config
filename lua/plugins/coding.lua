local languages = {
  bash = {
    language_server = "bashls",
    treesitter = { "bash" },
    tools = { "shfmt", "shellcheck" },
    filetype = "sh",
    formatters = { "shfmt" },
    lint_config = { "shellcheck" },
  },
  docker = {
    language_server = "dockerls",
    treesitter = { "dockerfile" },
    tools = { "hadolint" },
    filetype = "dockerfile",
    lint_config = { "hadolint" },
  },
  json = {
    language_server = "jsonls",
    language_server_config = {
      settings = {
        format = { enabled = false },
        schemas = {
          {
            description = "Package config",
            fileMatch = { "package.json" },
            url = "https://json.schemastore.org/package",
          },
        },
      },
    },
    treesitter = { "json" },
    tools = { "prettier" },
    filetype = "json",
    formatters = { "prettier" },
  },
  markdown = {
    language_server = "marksman",
    treesitter = { "markdown", "markdown_inline" },
    tools = { "markdownlint" },
    filetype = "markdown",
    formatters = { "prettier" },
    lint_config = { "markdownlint" },
  },
  lua = {
    language_server = "lua_ls",
    language_server_config = {
      settings = {
        cmd = { "lua-language-server" },
        format = {
          enable = false,
        },
        diagnostics = {
          globals = { "vim", "describe" },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    },
    treesitter = { "lua" },
    tools = { "stylua" },
    filetype = "lua",
    formatters = { "stylua" },
  },
  terraform = {
    language_server = "terraformls",
    treesitter = "hcl",
    filetype = "terraform",
    formatters = { "terraform_fmt" },
  },
  yaml = {
    language_server = "yamlls",
    language_server_config = {
      settings = {
        schemaStore = {
          enable = true,
          url = "https://www.schemastore.org/api/json/catalog.json",
        },
        schemas = {
          kubernetes = "*.yaml",
          ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
          ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
          ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
          ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        },
        format = { enabled = false },
        validate = false,
        completion = true,
        hover = true,
      },
    },
    treesitter = "yaml",
    tools = { "yamllint", "prettier" },
    filetype = "yaml",
    formatters = { "prettier" },
    lint_config = { "yamllint" },
  },
  typescript = {
    language_server = "ts_ls",
    treesitter = "typescript",
    tools = { "prettier", "eslint_d" },
    filetype = "typescript",
    formatters = { "prettier" },
  },
  go = {
    language_server = "gopls",
    treesitter = "go",
    filetype = "go",
    formatters = { "goimports", "gofumpt" },
  },
  toml = {
    treesitter = "toml",
    filetype = "toml",
  },
  vim = {
    treesitter = "vim",
    filetype = "vim",
  },
  python = {
    language_server = "pyright",
    language_server_config = {
      settings = {
        python = {
          venv = ".venv",
          venvPath = ".",
        },
      },
    },
    treesitter = "python",
    tools = { "flake8", "black" },
    filetype = "python",
    formatters = { "black" },
  },
  helm = {
    language_server = "helm_ls",
    treesitter = "helm",
    filetype = "helm",
  },
  nix = {
    language_server = "nil_ls",
    treesitter = "nix",
    filetype = "nix",
    formatters = { "alejandra" },
  },
  http = {
    treesitter = { "json", "http" },
    filetype = "http",
  },
  cs = {
    language_server = "omnisharp",
    language_server_config = {
      cmd = {
        string.format("%s/mason/bin/omnisharp", vim.fn.stdpath("data")),
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid()),
      },
      keys = {
        {
          "gd",
          "<cmd>lua require('omnisharp_extended').telescope_lsp_definition()<CR>",
          desc = "Goto Definition (C#)",
        },
        {
          "gy",
          "<cmd>lua require('omnisharp_extended').telescope_lsp_type_definition()<CR>",
          desc = "Goto T[y]pe Definition (C#)",
        },
        {
          "gr",
          "<cmd>lua require('omnisharp_extended').telescope_lsp_references()<CR>",
          desc = "References (C#)",
        },
        {
          "gI",
          "<cmd>lua require('omnisharp_extended').telescope_lsp_implementation()<CR>",
          desc = "Goto Implementation (C#)",
        },
      },
      settings = {
        RoslynExtensionsOptions = {
          enableDecompilationSupport = true,
        },
      },
    },
    treesitter = "c_sharp",
    filetype = "cs",
  },
}

local lsps = {}
local tools = {}
local formatters = {
  ["_"] = { "trim_whitespace" },
}
local linters = {}
local treesitter_langs = { "vim", "vimdoc" }
for _, lan in pairs(languages) do
  if lan.language_server ~= nil then
    lsps[lan.language_server] = lan.language_server_config ~= nil and lan.language_server_config or {}
  end

  if lan.tools ~= nil then
    for _, tool in ipairs(lan.tools) do
      table.insert(tools, tool)
    end
  end

  if lan.treesitter ~= nil then
    table.insert(treesitter_langs, lan.treesitter)
  end

  if lan.filetype ~= nil then
    if lan.formatters ~= nil then
      formatters[lan.filetype] = lan.formatters
    end

    if lan.lint_config ~= nil then
      linters[lan.filetype] = lan.lint_config
    end
  end
end

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = tools,
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = lsps,
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = formatters,
    },
  },
  { "nvim-treesitter/nvim-treesitter", opts = {
    ensure_installed = treesitter_langs,
  } },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = linters,
    },
  },
  {
    "hrsh7th/nvim-cmp",
    enable = true,
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
  {
    "towolf/vim-helm",
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
    },
    ft = "go",
    event = { "CmdlineEnter" },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require("go").setup({
        lsp_cfg = true,
        lsp_keymaps = false,
        lsp_document_formatting = false, -- conform handles formatting
        lsp_codelens = false,
        lsp_inlay_hints = {
          enable = false,
          only_current_line = true,
        },
      })
    end,
  },
  { "Hoffs/omnisharp-extended-lsp.nvim" },
}
