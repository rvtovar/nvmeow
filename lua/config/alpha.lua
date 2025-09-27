local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Insert the "Projects" button at a specific position (e.g. 3rd)
table.insert(dashboard.section.buttons.val, 3, dashboard.button("p", "  Projects", ":Telescope projects <CR>"))

-- Setup the dashboard
alpha.setup(dashboard.config)
