-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls","gopls","ts_ls" }
local nvlsp = require "nvchad.configs.lspconfig"
local util = require("lspconfig/util")

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

lspconfig.gopls.setup{
	capabilities = capabilities,
	on_attach =  on_attach,
	cmd = { 
		"gopls"
	},
  filetypes={"go","gomod","gowork","gotmpl"},
  root_dir=util.root_pattern("go.work","go.mod",".git")
,
  settings = {gopls={completeUnimported=true,
  usePlaceholders=true,
   analyses={unusedparams=true}
  }}
}
lspconfig.prismals.setup{}

