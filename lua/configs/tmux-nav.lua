local nvim_tmux_nav = require "nvim-tmux-navigation"

nvim_tmux_nav.setup {
  disable_when_zoomed = true,
}

local map = vim.keymap.set

map("n", "<C-h>", "<CMD>NvimTmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", "<CMD>NvimTmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", "<CMD>NvimTmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", "<CMD>NvimTmuxNavigateRight<CR>", { silent = true })
