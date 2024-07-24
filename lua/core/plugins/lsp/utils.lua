M = {}

AUTOFORMAT_ACTIVE = true
-- toggle null-ls's autoformatting
M.toggle_autoformat = function()
  AUTOFORMAT_ACTIVE = not AUTOFORMAT_ACTIVE
  require("core.utils.functions").notify(
    string.format("Autoformatting %s", AUTOFORMAT_ACTIVE and "on" or "off"),
    1,
    "lsp.utils"
  )
end

local augroup = vim.api.nvim_create_augroup("FormatAutogroup", {})

function M.custom_lsp_attach(_, bufnr)
  local wk = require("which-key")
  local default_options = { silent = true, noremap = true, buffer = bufnr }

  vim.api.nvim_buf_create_user_command(bufnr, "W", function()
    vim.cmd("noautocmd w")
  end, { desc = "Format buffer without format" })

  wk.add({
    {
      "<leader>mF",
      "<cmd>lua require('core.plugins.lsp.utils').toggle_autoformat()<cr>",
      desc = "Toggle format on save",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
    {
      "<leader>mf",
      "<cmd>Format<cr>",
      desc = "Format current buffer",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
  })

  vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = augroup,
    buffer = bufnr,
    callback = function()
      if AUTOFORMAT_ACTIVE then -- global var defined in functions.lua
        vim.cmd("FormatWrite")
      end
      require("lint").try_lint()
    end,
  })

  wk.add({
    { "<leader>l", group = "LSP" },
    {
      "<leader>lD",
      "<cmd>lua vim.lsp.buf.declaration()<cr>",
      desc = "Go to declaration",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
    {
      "<leader>lR",
      "<cmd>lua vim.lsp.buf.rename()<cr>",
      desc = "Rename",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
    {
      "<leader>la",
      "<cmd>lua vim.lsp.buf.code_action()<cr>",
      desc = "Code action",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
    {
      "<leader>ld",
      "<cmd>Telescope lsp_definitions<cr>",
      desc = "Go to definition",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
    {
      "<leader>le",
      "<cmd>Telescope diagnostics bufnr=0<cr>",
      desc = "Diagnostics",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
    {
      "<leader>li",
      "<cmd>Telescope lsp_implementations<cr>",
      desc = "Show implementations",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
    {
      "<leader>lk",
      "<cmd>lua vim.lsp.buf.hover()<cr>",
      desc = "Hover commands",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
    {
      "<leader>ll",
      "<cmd>lua vim.diagnostic.open_float()<CR>",
      desc = "Line diagnostics",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
    {
      "<leader>ln",
      "<cmd>lua vim.diagnostic.goto_next()<cr>",
      desc = "Next diagnostic",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
    {
      "<leader>lp",
      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      desc = "Prev diagnostic",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
    {
      "<leader>lq",
      "<cmd>lua vim.diagnostic.setloclist()<cr>",
      desc = "Quickfix diagnostics",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
    {
      "<leader>lr",
      "<cmd>Telescope lsp_references<cr>",
      desc = "References",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
    {
      "<leader>lt",
      "<cmd>Telescope lsp_type_definitions<cr>",
      desc = "Type definition",
      silent = true,
      noremap = true,
      buffer = bufnr,
    },
  })
end

return M
