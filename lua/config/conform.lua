-- ~/.config/nvim/lua/config/conform.lua

local conform = require "conform"

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black", "injected" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    sql = { "sql_formatter" },
    php = { "php_cs_fixer" },
    sh = { "shfmt" },
    xml = { "xmlformatter" },
    cpp = { "clang_format" },
    ["*"] = { "injected" }, -- fallback
  },

  formatters = {
    injected = {
      options = {
        ignore_errors = false,
        lang_to_formatters = {
          sql = { "sql_formatter" },
        },
        lang_to_ext = {
          sql = "sql",
        },
      },
    },
    sql_formatter = {
      command = "sql-formatter", -- adjust if needed
      stdin = true,
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

-- ========================
-- Autoformat on save
-- ========================
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    conform.format { async = false }
  end,
})

-- Optional: keymap to format manually
vim.keymap.set("n", "<leader>fm", function()
  conform.format { async = false }
end, { desc = "Format buffer" })

return options
