-- configs/neogit.lua

local neogit = require "neogit"

neogit.setup {
  -- Customize your configuration here

  -- Example: disable signs and only show minimal status
  signs = {
    section = { ">", "v" }, -- Signs for collapsed/expanded sections
    item = { ">", "v" }, -- Signs for collapsed/expanded items
    hunk = { "", "" }, -- Signs for added/removed hunks
  },

  integrations = {
    diffview = true, -- Integrate with diffview.nvim
  },

  -- Example: auto-show the Neogit buffer when opening a git repository
  auto_show_console = true,

  -- Example: customize the kind of buffer Neogit opens in
  kind = "split", -- Can be "tab", "replace", "split", "split_above", "vsplit", "auto"

  -- Optional: Customize keybindings
  mappings = {
    -- modify status buffer mappings
    status = {
      ["q"] = "Close", -- Close the Neogit window
      ["<Tab>"] = "Toggle", -- Toggle sections
    },
  },
}
