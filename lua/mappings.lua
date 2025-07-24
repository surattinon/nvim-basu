require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fc", function()
  require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
end, {desc = "[F]ind [C]onfig Folder"})
