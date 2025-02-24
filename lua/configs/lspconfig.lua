-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "clangd",
  "ts_ls",
  -- "ccls",
  "tailwindcss",
  "grammarly",
  "pyright"
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.tailwindcss.setup {
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescriptreact",
  },
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
      includeLanguages = {
        eelixir = "html-eex",
        eruby = "erb",
        htmlangular = "html",
        templ = "html",
      },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
      validate = true,
    },
  },
}

-- lspconfig.ccls.setup {
--   init_options = {
--     compilationDatabaseDirectory = "build",
--     index = {
--       threads = 0,
--     },
--     cache = {
--       directory = ".ccls-cache",
--     },
--     clang = {
--       excludeArgs = { "-frounding-math" },
--     },
--   },
-- }

lspconfig.grammarly.setup {
  filetypes = { "markdown" },
}
