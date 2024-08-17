---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
}

-- Define the custom highlight group for the linter symbol
vim.api.nvim_set_hl(0, "LinterActive", { fg = "#64bc65" }) -- Set the color to green

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

return M
