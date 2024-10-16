local M = {}

-- @param str string
function M.camel_case(str)
  return str:gsub('[-%.](.)', function(c)
    return c:upper()
  end)
end

-- @param str string
function M.pascal_case(str)
  local pascalCase = str:gsub('^%l', string.upper)
  return pascalCase:gsub('[-%.](.)', function(c)
    return c:upper()
  end)
end

-- @param str string
function M.snake_case(str)
  return M.pascal_case(str)
    :gsub('%u', function(c)
      return '_' .. c:lower()
    end)
    :sub(2)
end

-- @param str string
-- @param case 'camelCase' | 'snake_case' | 'PascalCase'
function M.to_case(str, case)
  if case == 'camelCase' then
    return M.camel_case(str)
  elseif case == 'snake_case' then
    return M.snake_case(str)
  elseif case == 'PascalCase' then
    return M.pascal_case(str)
  end
end

-- @param text string
-- @param options table
-- @param options.enter_insert_mode boolean
function M.insert_text_at_cursor(text, options)
  local enter_insert_mode = options and options.enter_insert_mode
  vim.api.nvim_put({ text }, '', true, enter_insert_mode)

  if enter_insert_mode then
    vim.cmd 'startinsert'
  end
end

return M
