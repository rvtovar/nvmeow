-- ~/.config/nvim/lua/config/dashboard.lua
local M = {}

local headers = {
  batvim = {
    "                            ",
    "           /\\                 /\\           ",
    "          / \\'._   (\\_/)   _.'/ \\          ",
    "         / .''._'--(o.o)--'_.''. \\         ",
    "        /.' _/ |`'=/ \" \\='`| \\_ `.\\        ",
    "       /` .' `\\;-,'\\___/',-;/` '. '\\        ",
    '      /.-\'       `"""`       `-.\\         ',
    "                            ",
    "           Bat Vim!         ",
    "                            ",
  },
  nvmeow_small = {
    "       /\\_/\\        ",
    "      ( o.o )       ",
    "       > ^ <        ",
    "                     ",
    "     😺 NvMeow Vim!  ",
  },
  nvmeow_full = {
    "  __      __          __  __                        ",
    " /\\ \\  __/\\ \\        /\\ \\/\\ \\                       ",
    " \\ \\ \\/\\ \\ \\ \\      _\\_\\ \\ \\ \\____     __          ",
    "  \\ \\ \\ \\ \\ \\ \\   /'_`\\ \\ \\ \\ '__`\\  /'__`\\        ",
    "   \\ \\ \\_/ \\_\\ \\_/\\ \\L\\ \\ \\ \\ \\L\\ \\/\\  __/        ",
    "    \\ `\\___x___/'\\ \\___,_\\_\\_\\ ,__/\\ \\____\\       ",
    "     '\\/__//__/   \\/__,_ /\\ \\ \\/  \\/____/       ",
    "                           \\ \\_\\                      ",
    "                            \\/_/                      ",
    "           /\\_/\\  😺 NvMeow Vim!  /\\_/\\             ",
    "          ( o.o )                 ( o.o )           ",
    "           > ^ <                   > ^ <            ",
  },
}

local save_file = vim.fn.stdpath "data" .. "/dh.lua"
local save_file = vim.fn.stdpath "data" .. "/theme.lua"

-- Load saved header if exists
local function load_header()
  local f = loadfile(save_file)
  if f then
    local ok, header = pcall(f)
    if ok and headers[header] then
      return header
    end
  end
  return nil
end

-- Save header choice
local function save_header(header)
  local f = io.open(save_file, "w")
  if f then
    f:write("return '" .. header .. "'")
    f:close()
  end
end

-- load saved theme if exists
local function load_theme()
  local f = loadfile(save_file)
  if f then
    local ok, theme = pcall(f)
    if ok and theme then
      return theme
    end
  end
  return nil
end

-- Save themes
local function save_theme(theme)
  local f = io.open(save_file, "w")
  if f then
    f:write("return '" .. theme .. "'")
    f:close()
  end
end

-- Apply saved themes
local saved_theme = load_theme() or "duskfox"
vim.cmd("colorscheme " .. saved_theme)

-- Pick header using helper
function M.pick_header()
  local ok, picker_helpers = pcall(require, "helpers.telescope")
  if not ok then
    vim.notify("Telescope helper not found!", vim.log.levels.ERROR)
    return
  end

  picker_helpers.generic_picker(vim.tbl_keys(headers), "Select Dashboard Header", function(header_name)
    vim.g.dashboard_header = header_name
    save_header(header_name)

    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = headers[header_name]
    alpha.setup(dashboard.opts)

    if vim.api.nvim_buf_get_name(0):match ".*Alpha$" then
      vim.cmd "redraw"
    end

    vim.notify("Dashboard header set to: " .. header_name)
  end)
end

-- Pick colorscheme using helper
function M.pick_theme()
  local ok, picker_helpers = pcall(require, "helpers.telescope")
  if not ok then
    vim.notify("Telescope helper not found!", vim.log.levels.ERROR)
    return
  end

  picker_helpers.generic_picker(vim.fn.getcompletion("", "color"), "Select Colorscheme", function(theme)
    vim.cmd("colorscheme " .. theme)
    save_theme(theme)
    vim.notify("Colorscheme set to: " .. theme)
  end)
end

function M.pick_projects()
  local ok, telescope = pcall(require, "telescope")
  if not ok then
    vim.notify("Telescope not found!", vim.log.levels.ERROR)
    return
  end

  if not telescope.extensions or not telescope.extensions.project then
    vim.notify("Telescope Project extension not loaded!", vim.log.levels.ERROR)
    return
  end

  -- Call the project picker directly
  telescope.extensions.project.project {
    layout_strategy = "vertical",
    layout_config = {
      height = 0.4,
      width = 0.5,
      prompt_position = "bottom",
      preview_height = 0,
    },
  }
end

-- Setup Alpha dashboard
M.setup = function()
  local alpha_ok, alpha = pcall(require, "alpha")
  if not alpha_ok then
    return
  end

  local dashboard_ok, dashboard = pcall(require, "alpha.themes.dashboard")
  if not dashboard_ok then
    return
  end

  -- Use saved header or default
  local header_choice = load_header() or "nvmeow_full"
  vim.g.dashboard_header = header_choice
  dashboard.section.header.val = headers[header_choice]

  -- Buttons
  dashboard.section.buttons.val = {
    dashboard.button("fp", "  Recent Projects", ":lua require('config.dashboard').pick_projects()<CR>"),
    dashboard.button("ff", "  Find File", ":Telescope find_files<CR>"),
    dashboard.button("fo", "  Recent Files", ":Telescope oldfiles<CR>"),
    dashboard.button("fw", "󰈭  Find Word", ":Telescope live_grep<CR>"),
    dashboard.button("th", "󱥚  Themes", ":lua require('config.dashboard').pick_theme()<CR>"),
    dashboard.button("ch", "  Mappings", ":WhichKey<CR>"),
    dashboard.button("hh", "  Change Header", ":lua require('config.dashboard').pick_header()<CR>"),
  }

  -- Footer
  dashboard.section.footer.val = function()
    local stats = require("lazy").stats()
    local ms = math.floor(stats.startuptime)
    return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. " ms"
  end

  alpha.setup(dashboard.opts)
end

return M
