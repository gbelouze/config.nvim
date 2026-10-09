-- Conditions and nodes shared by the Lua snippets in `snippets/`

local M = {}
local ls = require 'luasnip'
local make_condition = require('luasnip.extras.conditions').make_condition

-- Relies on vimtex's regex syntax, which is why treesitter is not attached to tex buffers
local function in_mathzone() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end

M.in_mathzone = make_condition(in_mathzone)

-- Inside typst-style `$...$` maths: an odd number of unescaped `$` before the cursor
local function in_between_dollars()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local row = cursor_pos[1]
  local col = cursor_pos[2]

  local lines = vim.api.nvim_buf_get_lines(0, 0, row, false)
  lines[#lines] = lines[#lines]:sub(1, col)

  local count = 0
  for _, line in ipairs(lines) do
    for j = 1, #line do
      if line:sub(j, j) == '$' and (j == 1 or line:sub(j - 1, j - 1) ~= '\\') then count = count + 1 end
    end
  end

  return count % 2 == 1
end

M.in_between_dollars = make_condition(in_between_dollars)

-- The trigger does not directly follow a `\`
local function not_latex_command(line_to_cursor, matched_trigger) return line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)) ~= '\\' end

M.not_latex_command = make_condition(not_latex_command)

function M.recover_capture()
  return ls.function_node(function(_, snip) return snip.captures[1] end)
end

return M
