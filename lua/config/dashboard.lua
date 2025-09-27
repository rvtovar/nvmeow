
-- ~/.config/nvim/lua/config/dashboard.lua
local M = {}

M.setup = function()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")

  -- Header ASCII art
  dashboard.section.header.val = {
    "                            ",
    "           /\\                 /\\           ",
    "          / \\'._   (\\_/)   _.'/ \\          ",
    "         / .''._'--(o.o)--'_.''. \\         ",
    "        /.' _/ |`'=/ \" \\='`| \\_ `.\\        ",
    "       /` .' `\\;-,'\\___/',-;/` '. '\\        ",
    "      /.-'       `\"\"\"`       `-.\\         ",
    "                            ",
    "           Bat Vim!         ",
    "                            ",
  }

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
    local ms = math.floor(stats.startuptime) .. " ms"
    return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
  end

  alpha.setup(dashboard.opts)
end

return M
