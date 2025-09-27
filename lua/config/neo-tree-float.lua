local M = {}

function M.toggle_float()
  -- Set Neo-tree window to float, then toggle
  require("neo-tree.command").execute {
    toggle = true,
    position = "float",
    -- You can customize the float size here if you want
    -- e.g., config = { popup = { size = { height = "80%", width = "50%" } } }
  }
end

return M
