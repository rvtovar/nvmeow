local wk = require "which-key"

wk.add {
  -- Buffers
  { "<leader>b", group = "Buffers" },
  { "<leader>b1", ":BufferLineGoToBuffer 1<CR>", desc = "Buffer 1" },
  { "<leader>b2", ":BufferLineGoToBuffer 2<CR>", desc = "Buffer 2" },
  { "<leader>b<S-h>", ":BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
  { "<leader>b<S-l>", ":BufferLineCycleNext<CR>", desc = "Next Buffer" },

  -- Debug
  { "<leader>d", group = "Debug" },
  { "<leader>dC", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
  { "<leader>du", "<cmd>lua require('dap').ui.toggle()<CR>", desc = "Open DAP UI" },

  -- Find
  { "<leader>f", group = "Find" },
  { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File" },
  { "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
  { "<leader>fp", "<cmd>Telescope project<CR>", desc = "Recent Projects" },
  { "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "Find Word" },

  -- Git
  { "<leader>g", group = "Git" },
  { "<leader>glg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit (float)" },

  -- LSP
  { "<leader>l", group = "LSP" },
  { "<leader>lca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", desc = "Format Buffer" },
  { "<leader>lk", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover Documentation" },
  { "<leader>lrn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename Symbol" },
}
