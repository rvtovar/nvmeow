local lsp_defaults = require "config.lsp_defaults"

local servers = { "html", "cssls", "pyright", "puppet", "intelephense", "ts_ls" }

for _, server in ipairs(servers) do
  require("lspconfig")[server].setup(lsp_defaults.defaults())
end

-- clangd setup
require("lspconfig").clangd.setup(vim.tbl_extend("force", lsp_defaults.defaults(), {
  cmd = { "clangd-21" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  init_options = {
    clangdFileStatus = true,
    fallbackFlags = { "-std=c++23", "-fmodules" },
  },
}))
