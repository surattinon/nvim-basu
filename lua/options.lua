require "nvchad.options"
local opt = vim.opt

-- Number setup --
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "line"
opt.cmdheight = 0

-- Minimal number of screen lines to keep above and below the cursor --
opt.scrolloff = 10

-- NVIM builtin spelling --
opt.spelllang = "en_us"
opt.spell = true

-- Highlight when yanking text --
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
