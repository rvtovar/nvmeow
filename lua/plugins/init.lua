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
    config = function()
      require("telescope").load_extension "project"
    end,
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
              unstaged = "",
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
    "EdenEast/nightfox.nvim", -- make sure you have the theme plugin installed
    config = function()
      vim.cmd "colorscheme nightfox" -- or duskfox, nordfox, etc.
    end,
  },
  {
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup {
        options = {
          show_buffer_close_icons = true, -- show "x" on each buffer
          buffer_close_icon = "x", -- per-buffer close icon
          show_close_icon = false, -- hide global close icon (recommended for minimal)
          show_tab_indicators = false, -- hide tab indicators
          show_buffer_icons = true, -- show filetype icons
          separator_style = "thin", -- simple separator style
          offsets = {
            {
              filetype = "neo-tree",
              text = "", -- no text over the panel
              separator = true, -- show a separator
            },
          },
          numbers = "none", -- no numbers
          indicator = { style = "none" }, -- no left indicator
          -- ADD THESE LINES for vim-bbye
          close_command = "Bdelete! %d", -- for closing buffers (with 'x')
          right_mouse_command = "Bdelete! %d", -- right click close
        },
        highlights = {
          buffer_selected = {
            fg = "#cdd6f4", -- Nightfox's fg1 (adjust for your variant if needed)
            bg = "#192330", -- Nightfox's bg1
            bold = false,
            italic = false,
          },
        },
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
          require("which-key").show { global = true }
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
