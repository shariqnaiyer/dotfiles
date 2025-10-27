require "nvchad.autocmds"

-- Auto-renumber markdown lists on insert leave
local autocmd = vim.api.nvim_create_autocmd

autocmd("InsertLeave", {
  pattern = "*.md",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    local modified = false
    local in_list = false
    local counter = 0
    local indent_level = ""

    for i, line in ipairs(lines) do
      local current_indent, num, rest = line:match("^(%s*)(%d+)%.%s(.*)$")

      if current_indent and num and rest then
        if not in_list or current_indent ~= indent_level then
          -- Start new list or sub-list
          in_list = true
          indent_level = current_indent
          counter = 1
        else
          counter = counter + 1
        end

        if tonumber(num) ~= counter then
          lines[i] = current_indent .. counter .. ". " .. rest
          modified = true
        end
      else
        -- Reset when we hit a non-list line
        if not line:match("^%s*$") and not line:match("^%s*[-*+]%s") then
          in_list = false
          counter = 0
        end
      end
    end

    if modified then
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    end
  end,
})
