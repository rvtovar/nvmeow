local M = {}

local lspconfig = require "lspconfig"

-- Create default capabilities for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- Default on_attach function
local function default_on_attach(client, bufnr)
  local opts = { buffer = bufnr, silent = true }

  -- Keymaps
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format { async = true }
  end, opts)

  -- Optional: show client attached message (can remove if verbose)
  -- print("LSP attached:", client.name)
end

-- Configure diagnostics and hover borders (NvChad defaults)
vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

local border = "rounded"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

-- Main function to return defaults
function M.defaults()
  return {
    on_attach = default_on_attach,
    capabilities = capabilities,
  }
end

return M
