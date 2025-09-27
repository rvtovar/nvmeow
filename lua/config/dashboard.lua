-- ~/.config/nvim/lua/config/dashboard.lua
local M = {}

M.setup = function()
  local alpha_ok, alpha = pcall(require, "alpha")
  if not alpha_ok then
    return
  end

  local dashboard_ok, dashboard = pcall(require, "alpha.themes.dashboard")
  if not dashboard_ok then
    return
  end

  -- Options: "batvim", "nvmeow_small", "nvmeow_full"
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

  -- Choose header
  local header_choice = vim.g.dashboard_header or "nvmeow_full"
  dashboard.section.header.val = headers[header_choice]

  -- Buttons
  dashboard.section.buttons.val = {
    dashboard.button("fp", "  Recent Projects", ":Telescope project<CR>"),
    dashboard.button("ff", "  Find File", ":Telescope find_files<CR>"),
    dashboard.button("fo", "  Recent Files", ":Telescope oldfiles<CR>"),
    dashboard.button("fw", "󰈭  Find Word", ":Telescope live_grep<CR>"),
    dashboard.button("th", "󱥚  Themes", ":Telescope colorscheme<CR>"),
    dashboard.button("ch", "  Mappings", ":WhichKey<CR>"),
  }

  -- Footer with plugin stats
  dashboard.section.footer.val = function()
    local stats = require("lazy").stats()
    local ms = math.floor(stats.startuptime)
    return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. " ms"
  end

  -- Setup
  alpha.setup(dashboard.opts)
end

return M
