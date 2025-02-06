local oil = require "oil"

-- Opens current directory of oil in a new tmux pane
local function open_tmux_pane_to_directory(direction)
  local cwd = oil.get_current_dir()
  if not cwd then
    vim.notify("Could not retrieve the current directory from oil.nvim", vim.log.levels.ERROR)
    return
  end

  local escaped_cwd = vim.fn.shellescape(cwd)
  local tmux_cmd = string.format("tmux split-window -%s -c %s", direction, escaped_cwd)
  os.execute(tmux_cmd)
end

-- Opens file under cursor in a new tmux pane
local function open_tmux_pane_to_file_in_neovim(direction)
  local cwd = oil.get_current_dir()
  if not cwd then
    vim.notify("Could not retrieve the current directory from oil.nvim", vim.log.levels.ERROR)
    return
  end
  local cursor_entry = oil.get_cursor_entry()
  if not cursor_entry then
    vim.notify("Could not retrieve the file under cursor from oil.nvim", vim.log.levels.ERROR)
    return
  end

  local escaped_cwd = vim.fn.shellescape(cwd)
  local tmux_cmd = string.format('tmux split-window -%s -c %s "nvim %s"', direction, escaped_cwd, cursor_entry.name)
  os.execute(tmux_cmd)
end

oil.setup {
  columns = { "relativenumber", "icon" },
  win_options = {
    signcolumn = "yes:3",
  },
  view_options = {
    show_hidden = true,
  },
  delete_to_trash = true, -- Deletes to trash
  skip_confirm_for_simple_edits = true,
  use_default_keymaps = false,
  keymaps = {
    ["<CR>"] = "actions.select",
    ["-"] = "actions.parent",
    ["<C-o>"] = function()
      open_tmux_pane_to_directory "h"
    end,
    ["<Leader>o"] = function()
      open_tmux_pane_to_file_in_neovim "h"
    end,
  },
  float = {
    padding = 5,
    max_width = 130,
    max_height = 100,
    border = "solid",
  },
}

local status_const = require "oil-vcs-status.constant.status"
local StatusType = status_const.StatusType
require("oil-vcs-status").setup {
  -- Executable path of each version control system.
  vcs_executable = {
    git = "git",
    svn = "svn",
  },
  status_symbol = {
    [StatusType.Added] = "",
    [StatusType.Copied] = "󰆏",
    [StatusType.Deleted] = "",
    [StatusType.Ignored] = "",
    [StatusType.Modified] = "",
    [StatusType.Renamed] = "",
    [StatusType.TypeChanged] = "󰉺",
    [StatusType.Unmodified] = " ",
    [StatusType.Unmerged] = "",
    [StatusType.Untracked] = "",
    [StatusType.External] = "",

    [StatusType.UpstreamAdded] = "󰈞",
    [StatusType.UpstreamCopied] = "󰈢",
    [StatusType.UpstreamDeleted] = "",
    [StatusType.UpstreamIgnored] = " ",
    [StatusType.UpstreamModified] = "󰏫",
    [StatusType.UpstreamRenamed] = "",
    [StatusType.UpstreamTypeChanged] = "󱧶",
    [StatusType.UpstreamUnmodified] = " ",
    [StatusType.UpstreamUnmerged] = "",
    [StatusType.UpstreamUntracked] = " ",
    [StatusType.UpstreamExternal] = "",
  },
  status_priority = {
    [StatusType.UpstreamIgnored] = 0,
    [StatusType.UpstreamUntracked] = 1,
    [StatusType.UpstreamUnmodified] = 2,

    [StatusType.UpstreamCopied] = 3,
    [StatusType.UpstreamRenamed] = 3,
    [StatusType.UpstreamTypeChanged] = 3,

    [StatusType.UpstreamDeleted] = 4,
    [StatusType.UpstreamModified] = 4,
    [StatusType.UpstreamAdded] = 4,

    [StatusType.UpstreamUnmerged] = 5,

    [StatusType.Ignored] = 10,
    [StatusType.Untracked] = 11,
    [StatusType.Unmodified] = 12,

    [StatusType.Copied] = 13,
    [StatusType.Renamed] = 13,
    [StatusType.TypeChanged] = 13,

    [StatusType.Deleted] = 14,
    [StatusType.Modified] = 14,
    [StatusType.Added] = 14,

    [StatusType.Unmerged] = 15,
  },
}

local map = vim.keymap.set

map("n", "_", require("oil").toggle_float, { noremap = true, silent = true })
