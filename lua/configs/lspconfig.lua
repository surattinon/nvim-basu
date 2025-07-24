require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  -- "clangd",
  "ts_ls",
  "r_language_server",
  "tailwindcss",
  "grammarly",
  "pyright",
  "zls",
  "sqls",
  "gopls",
  "stimulus_ls",
  "phpactor",
  "jsonls",
  "marksman",
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

lspconfig.phpactor.setup {
  filetypes = { "php", "html" },
}

lspconfig.html.setup {
  filetypes = { "php", "html" },
}

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

lspconfig.grammarly.setup {
  filetypes = { "markdown" },
}

lspconfig.sqls.setup {
  on_attach = function(client, bufnr)
    require("sqls").on_attach(client, bufnr)
  end,
  settings = {
    sqls = {
      connections = {
        {
          driver = "sqlite3",
          dataSourceName = "file:/home/basu/Documents/learn-sql/chinook.db",
        },
      },
    },
  },
}

lspconfig.ccls.setup {
  init_options = {
    compilationDatabaseDirectory = "build",
    index = {
      threads = 0,
    },
    clang = {
      excludeArgs = { "-frounding-math" },
    },
  },
}
