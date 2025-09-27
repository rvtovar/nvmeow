-- ~/.config/nvim/lua/config/dashboard_toggle.lua
local M = {}

function M.toggle()
  local bufname = vim.api.nvim_buf_get_name(0)
  local alpha_ok, alpha = pcall(require, "alpha")
  if not alpha_ok then
    vim.notify("Alpha not found!", vim.log.levels.ERROR)
    return
  end

  -- If the current buffer is Alpha, close it
  if bufname:match ".*Alpha$" then
    vim.cmd "bd!"
  else
    -- Otherwise, open Alpha dashboard
    vim.cmd "Alpha"
  end
end

return M
