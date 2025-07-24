local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettierd" },
    php = { "prettierd" },
    bash = { "beautysh" },
    python = { "black" },
    clang = { "clang-format" },
    sql = { "sleek" },
    go = { "gofumpt", "goimports" },
    nix = { "nixfmt" },
    json = { "jq" },
    markdown = { "mdformat" }
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
