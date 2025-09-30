require "config.lazy"
vim.opt.clipboard = "unnamedplus"
require "config.mappings"
vim.cmd "colorscheme duskfox"
vim.opt.number = true
vim.filetype.add {
  extension = {
    ixx = "cpp",
  },
}

vim.api.nvim_create_user_command("ClearSearch", function()
  vim.cmd('let @/ = ""')
end, {})


vim.g.dashboard_header = "nvmeow_full" -- or "nvmeow_small", or "nvmeow_full"
vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#82aaff", bg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = "#c3e88d", bg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#4CAF50", bg = "NONE" }) -- green for added
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#FFC107", bg = "NONE" }) -- amber for modified
vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#F44336", bg = "NONE" }) -- red for deleted
vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = "#9C27B0", bg = "NONE" }) -- purple for conflict
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#673AB7", bg = "NONE" }) -- deep purple for untracked
vim.o.tabstop = 4        -- How much space a TAB visually takes (default 8)
vim.o.shiftwidth = 4     -- How much to indent by default
vim.o.softtabstop = 4    -- How much a tab feels like while editing
vim.o.expandtab = false  -- Use real tabs, not spaces
require("config.dashboard").setup()
