-- ~/.config/nvim/lua/config/mappings.lua

-- Shorter alias
local map = vim.keymap.set

-- ========================
-- ToggleTerm / Lazygit
-- ========================
local Terminal = require("toggleterm.terminal").Terminal

-- Lazygit floating terminal
local lazygit = Terminal:new { cmd = "lazygit", hidden = true, direction = "float" }

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

map(
  "n",
  "<leader>lg",
  "<cmd>lua _LAZYGIT_TOGGLE()<CR>",
  { desc = "Toggle Lazygit (float)", noremap = true, silent = true }
)

-- Generic floating terminal
map("n", "<C-f><C-t>", function()
  Terminal:new({ direction = "float" }):toggle()
  vim.cmd "startinsert!" -- automatically enter terminal mode
end, { noremap = true, silent = true, desc = "ToggleTerm Float" })

-- Close floating terminal from terminal mode
map(
  "t",
  "<C-f><C-t>",
  "<C-\\><C-n>:ToggleTerm direction=float<CR>",
  { noremap = true, silent = true, desc = "ToggleTerm Float Close" }
)

-- ========================
-- General shortcuts
-- ========================
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>") -- optional save shortcut

-- ========================
-- Neo-tree
-- ========================
map("n", "<C-n>", "<cmd>Neotree left toggle<CR>", { noremap = true, silent = true, desc = "Neo-tree Sidebar" })
map("n", "<C-f><C-n>", "<cmd>Neotree float toggle<CR>", { noremap = true, silent = true, desc = "Neo-tree Floating" })

-- ========================
-- LSP
-- ========================
map("n", "<leader>k", vim.lsp.buf.hover, { desc = "LSP Hover" })

-- ========================
-- Add any additional mappings here
-- ========================

map("n", "<S-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })

-- Toggle Dashboard
vim.keymap.set("n", "<leader>ad", ":lua require('helpers.dashboard').toggle()<CR>", { desc = "Toggle Dashboard" })

-- Clear search highlighting

vim.keymap.set("n", "<leader>/", function()
  vim.cmd 'let @/ = ""'
end, { desc = "Clear search highlight" })

-- Example mapping in your Neovim config (init.lua)
vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "Search Buffers" })
