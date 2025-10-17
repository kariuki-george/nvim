-- load defaults i.e lua_lsp
-- require("nvchad.configs.lspconfig").defaults()
--
-- local lspconfig = require "lspconfig"
--
-- -- EXAMPLE
-- local nvlsp = require "nvchad.configs.lspconfig"
-- local servers = { "html", "cssls", "gopls", "ts_ls", "protols", "prismals" }
-- local util = require "lspconfig/util"
--
-- -- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end
--
-- -- configuring single server, example: typescript
-- -- lspconfig.tsserver.setup {
-- --   on_attach = nvlsp.on_attach,
-- --   on_init = nvlsp.on_init,
-- --   capabilities = nvlsp.capabilities,
-- -- }
--
-- lspconfig.gopls.setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   cmd = {
--     "gopls",
--   },
--   filetypes = { "go", "gomod", "gowork", "gotmpl" },
--   root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--   settings = { gopls = { completeUnimported = true, usePlaceholders = true, analyses = { unusedparams = true } } },
-- }
--

require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"
local servers = { "html", "cssls", "gopls", "ts_ls", "protols" }

local function setup_server(name, opts)
  vim.lsp.config(
    name,
    vim.tbl_deep_extend("force", {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }, opts or {})
  )
  vim.lsp.enable(name)
end

for _, server in ipairs(servers) do
  setup_server(server)
end

-- local util = require "lspconfig/util"
-- custom config for gopls
-- setup_server("gopls", {
--   cmd = { "gopls" },
--   filetypes = { "go", "gomod", "gowork", "gotmpl" },
--   root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--   settings = {
--     gopls = {
--       completeUnimported = true,
--       usePlaceholders = true,
--       analyses = { unusedparams = true },
--     },
--   },
-- })
