---@class MyChadrcConfig
local M = {}

-- Define the custom highlight group for the linter symbol
vim.api.nvim_set_hl(0, "LinterActive", { fg = "#64bc65" })

M.ui = {
  statusline = {
    modules = {
      linter = function()
        local linters = require("lint").get_running()
        if #linters > 0 then
          return "%#LinterActive#󰦕%*" -- Apply the custom highlight group
        end
        return ""
      end,
    },
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "linter", "lsp", "cwd", "cursor" },
  },
}

M.base46 = {
  theme = "ayu_dark",
}

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("base46").toggle_transparency()
  end,
})

-- Load custom mappings
M.mappings = require "mappings"

return M
