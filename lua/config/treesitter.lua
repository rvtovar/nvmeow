require("nvim-treesitter.configs").setup {
  ensure_installed = { "python", "sql", "php" }, -- both languages needed
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
