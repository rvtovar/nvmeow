return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections.lualine_b = {
      { "branch", icon = "" },
      "diff",
      "diagnostics",
    }
  end,
}
