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
