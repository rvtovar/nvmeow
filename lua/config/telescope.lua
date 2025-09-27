require("telescope").setup {
  defaults = {
    file_ignore_patterns = { "%.git/", ".git/" },
  },
  extensions = {
    project = {
      base_dirs = {
        "~/Scripts", -- replace with your projects directory
        { "~/Work/", max_depth = 2 },
      },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "asc",
      sync_with_nvim_tree = true, -- default false
    },
    file_browser = {
      hidden = false,
    },
  },
}
-- load custom configs
require("telescope").load_extension "noice"
require("telescope").load_extension "file_browser"
require("telescope").load_extension "project"
