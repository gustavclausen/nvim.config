local settings = require("core.settings")

local tools = {}

for _, lan in pairs(settings.languages) do
  for _, tool in ipairs(lan.tools) do
    table.insert(tools, tool)
  end
end

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({})
    require("mason-lspconfig").setup({})
    require("mason-tool-installer").setup({
      ensure_installed = tools,
      start_delay = 3000,
    })
  end,
}
