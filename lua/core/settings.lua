local M = {}

M.theme = "github"

M.formatters = {
  prettier = function()
    return require("core.plugins.formatters.prettier")
  end,
  alejandra = function()
    return require("core.plugins.formatters.alejandra")
  end,
}

M.languages = {
  bash = {
    language_server = "bashls",
    language_server_settings = nil,
    treesitter = { "bash" },
    tools = { "bash-language-server", "shfmt", "shellcheck" },
    filetype = "sh",
    formatters = { "shfmt" },
    lint_config = { "shellcheck" },
  },
  docker = {
    language_server = "dockerls",
    language_server_settings = nil,
    treesitter = { "dockerfile" },
    tools = { "dockerfile-language-server", "hadolint" },
    filetype = "dockerfile",
    lint_config = { "hadolint" },
  },
  json = {
    language_server = "jsonls",
    language_server_settings = {
      format = { enabled = false },
      schemas = {
        {
          description = "Package config",
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package",
        },
      },
    },
    treesitter = { "json" },
    tools = { "json-lsp", "prettier" },
    filetype = "json",
    formatters = { "prettier" },
    lint_config = nil,
  },
  markdown = {
    language_server = "marksman",
    language_server_settings = nil,
    treesitter = { "markdown", "markdown_inline" },
    tools = { "marksman", "markdownlint" },
    filetype = "markdown",
    formatters = { "prettier" },
    lint_config = { "markdownlint" },
  },
  lua = {
    language_server = "lua_ls",
    language_server_settings = {
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
    treesitter = { "lua" },
    tools = { "lua-language-server", "stylua" },
    filetype = "lua",
    formatters = { "stylua" },
    lint_config = nil,
  },
  terraform = {
    language_server = "terraformls",
    language_server_settings = nil,
    treesitter = "hcl",
    tools = { "terraform-ls" },
    filetype = "terraform",
    formatters = { "terraform_fmt" },
    lint_config = nil,
  },
  yaml = {
    language_server = "yamlls",
    language_server_settings = {
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
    extra_attach = function(bufnr)
      if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
        vim.diagnostic.disable()
      end
    end,
    treesitter = "yaml",
    tools = { "yaml-language-server", "yamllint", "prettier" },
    filetype = "yaml",
    formatters = { "prettier" },
    lint_config = { "yamllint" },
  },
  typescript = {
    language_server = "ts_ls",
    language_server_settings = nil,
    treesitter = nil,
    tools = { "typescript-language-server", "prettier", "eslint_d" },
    filetype = "typescript",
    formatters = { "prettier" },
    lint_config = nil,
  },
  go = {
    language_server = "gopls",
    language_server_settings = nil,
    treesitter = "go",
    tools = { "gopls" },
    filetype = "go",
    formatters = { "goimports", "gofmt" },
    lint_config = nil,
  },
  toml = {
    language_server = nil,
    language_server_settings = nil,
    treesitter = "toml",
    tools = {},
    filetype = "toml",
    lint_config = nil,
  },
  vim = {
    language_server = nil,
    language_server_settings = nil,
    treesitter = "vim",
    tools = {},
    filetype = "vim",
    lint_config = nil,
  },
  python = {
    language_server = "pyright",
    language_server_settings = {
      python = {
        venv = ".venv",
        venvPath = ".",
      },
    },
    treesitter = "python",
    tools = { "pyright", "flake8", "black" },
    filetype = "python",
    formatters = { "black" },
    lint_config = nil,
  },
  helm = {
    language_server = "helm_ls",
    language_server_settings = nil,
    tools = { "helm-ls" },
    treesitter = nil,
    filetype = "helm",
    lint_config = nil,
  },
  nix = {
    language_server = "nil_ls",
    language_server_settings = nil,
    tools = { "nil_ls" },
    treesitter = "nix",
    filetype = "nix",
    formatters = { "alejandra" },
    lint_config = nil,
  },
  http = {
    language_server = nil,
    language_server_settings = nil,
    tools = {},
    treesitter = { "json", "http" },
    filetype = "http",
    lint_config = nil,
  },
  cs = {
    language_server = "omnisharp",
    language_server_settings = nil,
    language_server_cmd = {
      string.format("%s/mason/bin/omnisharp", vim.fn.stdpath("data")),
      "--languageserver",
      "--hostPID",
      tostring(vim.fn.getpid()),
    },
    tools = {},
    treesitter = "c_sharp",
    filetype = "cs",
    lint_config = nil,
  },
}

return M
