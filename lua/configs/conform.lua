local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    rust = { "rustfmt", lsp_fallback = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    go = { "gofmt" },
    markdown = { "mdsf" },
    typescript = { "deno_fmt" },
    json = { "deno_fmt" },
    python = { "isort", "black" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
