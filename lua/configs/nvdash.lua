local M = {}

M.load_on_startup = true

M.header = {

  "                                                                   ",
  "                                                                  ",
  "  ▄▄   ▄▄    ▄▄▄    ▄▄▄   ▄▄▄  󰗣                                   ",
  " █  █ █  █  █   █  █   █▄█   █                                     ",
  " █  █▄█  █  █   █  █    █    █                                     ",
  " █       █  █   █  █         █    ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ",
  " █       █  █   █  █   ███   █    █░▄▄▀█░██░███░▄▄▀█░▄▄▀█░▄▄█░██░█ ",
  "  █     █   █   █  █  █   █  █    █░▄▄▀█░▀▀░███░▄▄▀█░▀▀░█▄▄▀█░██░█ ",
  "   █▄▄▄█     █▄█    ██     ██     █▄▄▄▄█▀▀▀▄███▄▄▄▄█▄██▄█▄▄▄██▄▄▄█ ",
  "                                       ▀▀▀▀▀                       ",
  "                                                                   ",
  "                                                                   ",
  "                                                                   ",
}

M.buttons = {
  { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
  { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
  { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
  {
    txt = "󰈭  Find Config",
    keys = "fc", cmd = 'lua require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }'
  },
  { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
  { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
  { txt = "  Quit", keys = "q", cmd = ":quit!" },

  { txt = "" },

  {
    txt = function()
      local stats = require("lazy").stats()
      local ms = math.floor(stats.startuptime) .. " ms"
      return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
    end,
    hl = "NvDashFooter",
    no_gap = true,
  },
}

return M
