
-- ~/.config/nvim/lua/config/dap.lua
local dap = require("dap")
local dapui = require("dapui")

-- ========================
-- DAP Adapters
-- ========================
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
    args = { "--port", "${port}" },
  },
}

-- ========================
-- DAP Configurations
-- ========================
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- ========================
-- DAP-UI Setup
-- ========================
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  layouts = {
    {
      elements = { "scopes", "breakpoints", "stacks", "watches" },
      size = 40,
      position = "left",
    },
    {
      elements = { "repl" },
      size = 10,
      position = "bottom",
    },
  },
  floating = {
    border = "rounded",
    mappings = { close = { "q", "<Esc>" } },
  },
  windows = { indent = 1 },
})

-- ========================
-- Auto open/close UI with DAP
-- ========================
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- ========================
-- Safe toggle function
-- ========================
function _DAPUI_TOGGLE()
  local ok, _ = pcall(dapui.toggle)
  if not ok then
    vim.notify("DAP UI not ready", vim.log.levels.WARN)
  end
end

-- ========================
-- Keymaps
-- ========================
local map = vim.keymap.set
map("n", "<F5>", dap.continue, { desc = "DAP Continue" })
map("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
map("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
map("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })
map("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "DAP Set Conditional Breakpoint" })
map("n", "<leader>C", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
map("n", "<leader>du", _DAPUI_TOGGLE, { desc = "Toggle DAP UI" })

