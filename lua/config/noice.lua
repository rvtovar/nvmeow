return {
  lsp = {
    hover = { enabled = false },
    signature = { enabled = false },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
  messages = {
    enabled = true,
    view = "notify",
  },
  routes = {
    -- All messages in a small, styled popup
    {
      filter = { event = "msg_show" },
      view = "mini",
      opts = { timeout = 2000 },
    },
    -- Specific LSP deprecation warnings
    {
      filter = { event = "msg_show", find = "deprecated" },
      view = "mini",
      opts = { timeout = 2000 },
    },
  },
  views = {
    cmdline_popup = {
      position = { row = 5, col = "50%" },
      size = { width = 60, height = "auto" },
      border = { style = "rounded" },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
    popupmenu = {
      relative = "editor",
      position = { row = 8, col = "50%" },
      size = { width = 60, height = 10 },
      border = { style = "rounded", padding = { 0, 1 } },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
    mini = {
      timeout = 10000, -- Auto-dismiss in 2 seconds
      blend = 15, -- Slight transparency
      border = "rounded", -- Rounded corners
      padding = { 0, 1 }, -- Padding inside popup
      win_options = {
        winhighlight = {
          Normal = "Normal",
          FloatBorder = "DiagnosticInfo",
          FloatTitle = "Title",
        },
      },
    },
  },
}
