return {
  { import = "nvchad.blink.lazyspec" },
  {
    "Saghen/blink.cmp",
    opts = require "configs.blink",
  },
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
    -- cmd = { "Pioinit", "Piorun", "Piocmdh", "Piocmdf", "Piolib", "Piomon", "Piodebug", "Piodb" },
    ft = { "cpp", "c" },
    dependencies = {
      { "akinsho/toggleterm.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-lua/plenary.nvim" },
      {
        -- WhichKey helps you remember your Neovim keymaps,
        -- by showing available keybindings in a popup as you type.
        "folke/which-key.nvim",
        opts = {
          preset = "helix", --'modern', --"classic", --
          sort = { "order", "group", "manual", "mod" },
        },
      },
    },

    config = function()
      require "configs.platformio"
    end,
  },
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   event = "VeryLazy",
  --   dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  --   ---@module 'render-markdown'
  --   ---@type render.md.UserConfig
  --   opts = require "configs.render-markdown",
  -- },
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = true,
  --   version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  --   opts = require "configs.avante",
  --   build = "make",
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --   },
  -- },
  {
    "NickvanDyke/opencode.nvim",
    event = "VeryLazy",
    ---@type opencode.Config
    dependencies = {
      "folke/snacks.nvim",
    },
    opts = {},
    -- stylua: ignore
    keys = {
      {
        '<leader>ot',
        function()
          require('snacks.terminal').toggle('opencode', { win = { position = 'right' } })
        end,
        desc = "Toggle opencode",
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
      -- Global Minimap Controls
      { "<leader>nm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
      { "<leader>no", "<cmd>Neominimap Enable<cr>", desc = "Enable global minimap" },
      { "<leader>nc", "<cmd>Neominimap Disable<cr>", desc = "Disable global minimap" },
      { "<leader>nr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh global minimap" },

      -- Window-Specific Minimap Controls
      { "<leader>nwt", "<cmd>Neominimap WinToggle<cr>", desc = "Toggle minimap for current window" },
      { "<leader>nwr", "<cmd>Neominimap WinRefresh<cr>", desc = "Refresh minimap for current window" },
      { "<leader>nwo", "<cmd>Neominimap WinEnable<cr>", desc = "Enable minimap for current window" },
      { "<leader>nwc", "<cmd>Neominimap WinDisable<cr>", desc = "Disable minimap for current window" },

      -- Tab-Specific Minimap Controls
      { "<leader>ntt", "<cmd>Neominimap TabToggle<cr>", desc = "Toggle minimap for current tab" },
      { "<leader>ntr", "<cmd>Neominimap TabRefresh<cr>", desc = "Refresh minimap for current tab" },
      { "<leader>nto", "<cmd>Neominimap TabEnable<cr>", desc = "Enable minimap for current tab" },
      { "<leader>ntc", "<cmd>Neominimap TabDisable<cr>", desc = "Disable minimap for current tab" },

      -- Buffer-Specific Minimap Controls
      { "<leader>nbt", "<cmd>Neominimap BufToggle<cr>", desc = "Toggle minimap for current buffer" },
      { "<leader>nbr", "<cmd>Neominimap BufRefresh<cr>", desc = "Refresh minimap for current buffer" },
      { "<leader>nbo", "<cmd>Neominimap BufEnable<cr>", desc = "Enable minimap for current buffer" },
      { "<leader>nbc", "<cmd>Neominimap BufDisable<cr>", desc = "Disable minimap for current buffer" },

      ---Focus Controls
      { "<leader>nf", "<cmd>Neominimap Focus<cr>", desc = "Focus on minimap" },
      { "<leader>nu", "<cmd>Neominimap Unfocus<cr>", desc = "Unfocus minimap" },
      { "<leader>ns", "<cmd>Neominimap ToggleFocus<cr>", desc = "Switch focus on minimap" },
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
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        -- per_filetype = {
        --   ["html"] = {
        --     enable_close = false,
        --   },
        -- },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "BufReadPre",
    -- NOTE: And you can specify dependencies as well
    dependencies = {
      -- Creates a beautiful debugger UI
      "rcarriga/nvim-dap-ui",

      -- Required dependency for nvim-dap-ui
      "nvim-neotest/nvim-nio",

      -- Installs the debug adapters for you
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",

      -- NOTE: debugger repos here
      "leoluz/nvim-dap-go",
    },
    config = function()
      require "configs.dap"
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      require("rainbow-delimiters.setup").setup {}
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    config = function()
      local presets = require "markview.presets"
      require("markview").setup {
        markdown = {
          headings = presets.headings.glow,
          horizontal_rules = presets.horizontal_rules.thick,
          tables = presets.tables.rounded,
        },
        experimental = { check_rtp = false },
      }
    end,
  },
  {
    "shortcuts/no-neck-pain.nvim",
    event = "VeryLazy",
    version = "*",
  },
}
