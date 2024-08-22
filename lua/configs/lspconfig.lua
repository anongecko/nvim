-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "biome" } -- Removed "pyright" from this list
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.pylyzer.setup {
  cmd = { "/opt/miniconda3/bin/pylyzer", "--server" },
  on_attach = nvlsp.on_attach, -- Assuming nvlsp is defined correctly
  capabilities = nvlsp.capabilities,
}

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--  on_attach = nvlsp.on_attach,
--  on_init = nvlsp.on_init,
--  capabilities = nvlsp.capabilities,
-- }
