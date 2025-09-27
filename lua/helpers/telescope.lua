local M = {}

local pickers_ok, pickers = pcall(require, "telescope.pickers")
if not pickers_ok then
  return M
end

local finders_ok, finders = pcall(require, "telescope.finders")
if not finders_ok then
  return M
end

local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- Generic picker for any list
function M.generic_picker(items, prompt_title, on_select)
  pickers
    .new({}, {
      prompt_title = prompt_title or "Select",
      finder = finders.new_table {
        results = items,
        entry_maker = function(entry)
          return { value = entry, display = entry, ordinal = entry }
        end,
      },
      sorter = conf.generic_sorter {},
      layout_strategy = "vertical",
      layout_config = {
        height = 0.4,
        width = 0.5,
        prompt_position = "bottom",
        preview_height = 0,
      },
      attach_mappings = function(prompt_bufnr, map)
        local function select_item()
          local selection = action_state.get_selected_entry()
          if selection then
            on_select(selection.value)
          end
          actions.close(prompt_bufnr)
        end

        map("i", "<CR>", select_item)
        map("n", "<CR>", select_item)
        return true
      end,
    })
    :find()
end

return M
