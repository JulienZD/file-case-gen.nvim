local utils = require 'file-case-gen.utils'

local M = {}

function M.setup(options)
  -- TODO: Do something with options?
end

-- @param type 'camel' | 'snake' | 'pascal'
function M.insert_file_name_as(target_case)
  local file_name = vim.fn.expand '%:t:r'
  local file_as_text = utils.to_case(file_name, target_case)

  utils.insert_text_at_cursor(file_as_text, { enter_insert_mode = true })
end

return M
