local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    bash = { "beautysh" },
    python = { "black" },
    clang = { "clang-format" },
    sql = { "sqlfmt" },
    go = { "gofumpt" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
