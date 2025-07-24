local dap = require "dap"
local dapui = require "dapui"

-- NOTE: DAPUI AUTO OPEN
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end

--NOTE: DAP KEYMAPS
local map = vim.keymap.set
map("n", "B", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })
map("n", "<leader>dc", dap.continue, { desc = "[D]ebug [C]ontinue" })
map("n", "<leader>di", dap.step_into, { desc = "[D]ebug: Step [I]nto" })
map("n", "<leader>do", dap.step_over, { desc = "[D]ebug: Step [O]ver" })
map("n", "<leader>bb", function()
  dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Debug: Set Breakpoint" })
map("n", "<leader>dx", function()
  dapui.toggle()
end, { desc = "Toggle Debug UI" })

local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

require("mason-nvim-dap").setup {
  -- Makes a best effort to setup the various debuggers with
  -- reasonable debug configurations
  automatic_installation = true,

  -- You can provide additional configuration to the handlers,
  -- see mason-nvim-dap README for more information
  handlers = {},

  -- You'll need to check that you have the required things installed
  -- online, please don't ask me how to install them :)
  ensure_installed = {
    -- Update this to ensure that you have the debuggers for the langs you want
    "delve",
  },
}

-- Basic debugging keymaps, feel free to change to your liking!

-- Dap UI setup
-- For more information, see |:help nvim-dap-ui|
dapui.setup {
  -- Set icons to characters that are more likely to work in every terminal.
  --    Feel free to remove or use ones that you like more! :)
  --    Don't feel like these are good choices.
  icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
  controls = {
    icons = {
      pause = "⏸",
      play = "▶",
      step_into = "⏎",
      step_over = "⏭",
      step_out = "⏮",
      step_back = "b",
      run_last = "▶▶",
      terminate = "⏹",
      disconnect = "⏏",
    },
  },
}

-- NOTE: DAP CONFIG
-- Install golang specific config
require("dap-go").setup {
  delve = {
    -- On Windows delve must be run attached or it crashes.
    -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
    detached = vim.fn.has "win32" == 0,
  },
  dap_configurations = {
    {
      type = "go",
      name = "Launch API Server",
      request = "launch",
      program = "${workspaceFolder}/cmd/server",
    },
  },
}
