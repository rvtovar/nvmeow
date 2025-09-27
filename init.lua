require "config.lazy"
vim.opt.clipboard = "unnamedplus"
require "config.mappings"
require "config.whichkey"
vim.cmd "colorscheme duskfox"
vim.opt.number = true
vim.filetype.add {
  extension = {
    ixx = "cpp",
  },
}

vim.g.dashboard_header = "nvmeow_full" -- or "nvmeow_small", or "nvmeow_full"
require("config.dashboard").setup()
