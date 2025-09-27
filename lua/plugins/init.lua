return {

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = function()
      return require "config.conform"
    end,
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = false,
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          "clang-format",
        },
        auto_update = true,
        run_on_start = true,
      }
    end,
  },
  -- mini icons
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.icons").setup()
    end,
  },

  -- ToggleTerm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup {}
    end,
  },
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "config.lspconfig"
    end,
  },

  -- GitHub Copilot
  {
    "github/copilot.vim",
    lazy = false,
  },

  -- Themes
  { "EdenEast/nightfox.nvim" },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function(_, opts)
      -- Ensure parsers
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "python", "sql", "cpp" })

      -- Configure highlighting
      opts.highlight = opts.highlight or {}
      opts.highlight.enable = true
      opts.highlight.additional_vim_regex_highlighting = false
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- Optional: if you have SQL injections ready, require them here
      -- e.g., require("config.treesitter_injections")
    end,
  },

  { "bkegley/gloombuddy" },
  { "shaunsingh/nord.nvim" },

  -- Telescope plugins
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  -- Debug Adapter Protocol (DAP) plugins

  -- Lazy.nvim plugin spec
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      require("mason-nvim-dap").setup {
        ensure_installed = { "codelldb" },
        automatic_installation = true,
      }
      require("nvim-dap-virtual-text").setup()
      require "config.dap"
    end,
  }, -- Noice
  {
    "folke/noice.nvim",
    event = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = function()
      return require "config.noice"
    end,
  },

  -- Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      { "nvim-tree/nvim-web-devicons", lazy = false },
    },
    config = function()
      require("neo-tree").setup {
        default_component_configs = {
          git_status = {
            symbols = {
              added = "A",
              modified = "M",
              deleted = "D",
              renamed = "R",
              untracked = "U",
              ignored = "I",
              unstaged = "!",
              staged = "S",
              conflict = "C",
            },
          },
          root = {
            highight = "NeoTreeDirectoryName",
            icon = "🏠",
            align = "left",
          },
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      }
    end,
    lazy = false,
  },

  -- LSP file operations
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    lazy = false,
    config = function()
      require("lsp-file-operations").setup()
    end,
  },

  -- Window Picker
  {
    "s1n7ax/nvim-window-picker",
    lazy = false,
    version = "2.*",
    config = function()
      require("window-picker").setup {
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            buftype = { "terminal", "quickfix" },
          },
        },
      }
    end,
  },

  -- REST client
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>Rs", desc = "Send request" },
      { "<leader>Ra", desc = "Send all requests" },
      { "<leader>Rb", desc = "Open scratchpad" },
    },
    ft = { "http", "rest" },
    opts = {
      curl_opts = { "-k" },
      global_keymaps = true,
      global_keymaps_prefix = "<leader>R",
      kulala_keymaps_prefix = "",
    },
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require("config.dashboard").setup()
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup {
        options = {
          numbers = "ordinal", -- show buffer numbers
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          indicator = { icon = "▎", style = "icon" },
          buffer_close_icon = "",
          modified_icon = "●",
          close_icon = "",
          max_name_length = 30,
          max_prefix_length = 15,
          tab_size = 21,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = false,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          sort_by = "id",
        },
        highlights = {},
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections = opts.sections or {} -- ensure sections exists
      opts.sections.lualine_b = opts.sections.lualine_b or {}
      opts.sections.lualine_b = {
        { "branch", icon = "" },
        "diff",
        "diagnostics",
      }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    event = "InsertEnter", -- lazy-load when you start typing
    config = function()
      require "config.cmp" -- just require your cmp.lua
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
