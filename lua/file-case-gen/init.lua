local utils = require 'file-case-gen.utils'

local M = {}

M.config = {
  default_case = 'camelCase',
  file_overrides = {},
}

-- @param options tables
-- @param options.default_case 'camelCase' | 'PascalCase' | 'snake_case'
-- @param options.file_overrides tables A table of file overrides
--
-- @example
-- require('file-case-gen').setup({
--   default_case = 'camelCase',
--   file_overrides = {
--     ["%.controller%.ts$"] = "PascalCase", -- Use pascal case for files ending in controller.ts
--   },
-- })
function M.setup(options)
  M.config = vim.tbl_deep_extend('force', M.config, options or {})
end

local function get_file_case(file_name)
  for pattern, case in pairs(M.config.file_overrides) do
    if file_name:match(pattern) then
      return case
    end
  end

  return M.config.default_case
end

function M.insert_cased_file_name()
  local full_file_name = vim.fn.expand '%:t'
  local file_name = vim.fn.expand '%:t:r'
  local file_as_text = utils.to_case(file_name, get_file_case(full_file_name))

  utils.insert_text_at_cursor(file_as_text, { enter_insert_mode = true })
end

return M
