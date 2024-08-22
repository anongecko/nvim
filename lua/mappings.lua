require "nvchad.mappings"

local map = vim.keymap.set

-- Custom keybinding to enter command mode quickly
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Custom keybinding to exit insert mode quickly
map("i", "jk", "<ESC>")

-- Toggle transparency with <leader>tt
map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "Toggle transparency" })

-- Toggle nvim-lint for all languages with <leader>tl and a custom command
local lint_enabled = true

local function toggle_linting()
  lint_enabled = not lint_enabled
  if lint_enabled then
    -- Enable linting by restoring the autocommand
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("nvim_lint", { clear = true }),
      callback = function()
        require("lint").try_lint()
      end,
    })
    vim.notify "Linting enabled"
  else
    -- Disable linting by clearing the autocommand group
    vim.cmd "augroup nvim_lint | autocmd! | augroup END"
    -- Clear existing diagnostics
    vim.diagnostic.reset(nil, 0) -- Clear diagnostics for all buffers (use 0 for the current buffer only)
    vim.notify "Linting disabled"
  end
end

-- Keybinding to toggle linting
map("n", "<leader>tl", toggle_linting, { desc = "Toggle linting" })

-- Command to toggle linting
vim.api.nvim_create_user_command("Lint", toggle_linting, { desc = "Toggle linting on or off" })

local function get_active_linters()
  local ft = vim.bo.filetype
  local linters = require("lint").linters_by_ft[ft] or {}
  return linters
end

-- Command to display the status of linters
vim.api.nvim_create_user_command("LintStatus", function()
  if lint_enabled then
    local active_linters = get_active_linters()
    if #active_linters > 0 then
      vim.notify("Active linters for " .. vim.bo.filetype .. ": " .. table.concat(active_linters, ", "))
    else
      vim.notify("No linters configured for " .. vim.bo.filetype)
    end
  else
    vim.notify "Linting is currently disabled"
  end
end, {})
