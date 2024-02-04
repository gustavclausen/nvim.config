return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "onsails/lspkind-nvim",
  },
  config = function()
    local nvim_lsp = require("lspconfig")
    local utils = require("core.plugins.lsp.utils")
    local settings = require("core.settings")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    for _, lan in pairs(settings.languages) do
      if not (lan.language_server == nil) then
        nvim_lsp[lan.language_server].setup({
          on_attach = function(client, bufnr)
            utils.custom_lsp_attach(client, bufnr)
            if not (lan.extra_attach == nil) then
              lan.extra_attach(bufnr)
            end
          end,
          capabilities = capabilities,
          flags = { debounce_text_changes = 150 },
          settings = not lan.language_server_settings == nil and lan.language_server_settings or {},
        })
      end
    end
  end,
}
