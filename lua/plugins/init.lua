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
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = require "configs.avante",
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  ---@module "neominimap.config.meta"
  {
    "Isrothy/neominimap.nvim",
    version = "v3.*.*",
    enabled = true,
    lazy = false, -- NOTE: NO NEED to Lazy load
    -- Optional
    keys = {
      { "<leader>mm", "<cmd>Neominimap toggle<cr>", desc = "Toggle global minimap" },
      { "<leader>mo", "<cmd>Neominimap on<cr>", desc = "Enable global minimap" },
      { "<leader>mc", "<cmd>Neominimap off<cr>", desc = "Disable global minimap" },
      { "<leader>mr", "<cmd>Neominimap refresh<cr>", desc = "Refresh global minimap" },

      { "<leader>mwt", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
      { "<leader>mwr", "<cmd>Neominimap winRefresh<cr>", desc = "Refresh minimap for current window" },
      { "<leader>mwo", "<cmd>Neominimap winOn<cr>", desc = "Enable minimap for current window" },
      { "<leader>mwc", "<cmd>Neominimap winOff<cr>", desc = "Disable minimap for current window" },

      { "<leader>mtt", "<cmd>Neominimap tabToggle<cr>", desc = "Toggle minimap for current tab" },
      { "<leader>mtr", "<cmd>Neominimap tabRefresh<cr>", desc = "Refresh minimap for current tab" },
      { "<leader>mto", "<cmd>Neominimap tabOn<cr>", desc = "Enable minimap for current tab" },
      { "<leader>mtc", "<cmd>Neominimap tabOff<cr>", desc = "Disable minimap for current tab" },

      { "<leader>mbt", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
      { "<leader>mbr", "<cmd>Neominimap bufRefresh<cr>", desc = "Refresh minimap for current buffer" },
      { "<leader>mbo", "<cmd>Neominimap bufOn<cr>", desc = "Enable minimap for current buffer" },
      { "<leader>mbc", "<cmd>Neominimap bufOff<cr>", desc = "Disable minimap for current buffer" },

      { "<leader>mf", "<cmd>Neominimap focus<cr>", desc = "Focus on minimap" },
      { "<leader>mu", "<cmd>Neominimap unfocus<cr>", desc = "Unfocus minimap" },
      { "<leader>ms", "<cmd>Neominimap toggleFocus<cr>", desc = "Switch focus on minimap" },
    },
    init = function()
      ---@type Neominimap.UserConfig
      vim.g.neominimap = {
        auto_enable = false,
        layout = "split",
        split = {
          minimap_width = 15, ---@type integer
          fix_width = false, ---@type boolean
          direction = "right", ---@type Neominimap.Config.SplitDirection
          close_if_last_window = false, ---@type boolean
        },
      }
    end,
  },
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "Dbee",
    },
    build = function()
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup {}
    end,
  },
  {
    "vyfor/cord.nvim",
    event = "VeryLazy",
    build = ":Cord update",
    opts = {},
  },
  {
    "nanotee/sqls.nvim",
  },
}
