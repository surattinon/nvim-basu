return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "ranjithshegde/ccls.nvim",
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require "configs.noice"
    end,
  },

  {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    cmd = {
      "NvimTmuxNavigateLeft",
      "NvimTmuxNavigateDown",
      "NvimTmuxNavigateUp",
      "NvimTmuxNavigateRight",
    },
    config = function()
      require "configs.tmux-nav"
    end,
  },

  {
    "stevearc/overseer.nvim",
    config = function()
      require "configs.overseer"
    end,
  },

  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    dependencies = {
      "SirZenith/oil-vcs-status",
    },

    config = function()
      require "configs.oil"
    end,
  },

  {
    "R-nvim/R.nvim",
    ft = "r",
    lazy = false,
    version = "~0.1.0",
    config = function()
      require "configs.R"
    end,
  },

  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.mini"
    end,
  },

  {
    "anurag3301/nvim-platformio.lua",
    dependencies = {
      { "akinsho/nvim-toggleterm.lua" },
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    cmd = {
      "Pioinit",
      "Piorun",
      "Piocmd",
      "Piolib",
      "Piomon",
      "Piodebug",
      "Piodb",
    },
    config = function()
      require "configs.platformio"
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = require "configs.render-markdown",
  },
}
