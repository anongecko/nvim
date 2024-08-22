require("cheatsheet").setup {
  vim.keymap.set("n", "[?", require("cheatsheet").show_cheatsheet, { noremap = true }),
  -- Whether to show bundled cheatsheets

  -- For generic cheatsheets like default, unicode, nerd-fonts, etc
  bundled_cheatsheets = {
    enabled = { "default" },
  },

  bundled_plugin_cheatsheets = {
    disabled = {},
  },

  -- For bundled plugin cheatsheets, do not show a sheet if you
  -- don't have the plugin installed (searches runtimepath for
  -- same directory name)
  -- Key mappings bound inside the telescope window
  telescope_mappings = {
    ["<CR>"] = require("cheatsheet.telescope.actions").select_or_fill_commandline,
    ["<A-CR>"] = require("cheatsheet.telescope.actions").select_or_execute,
    ["<C-Y>"] = require("cheatsheet.telescope.actions").copy_cheat_value,
    ["<C-E>"] = require("cheatsheet.telescope.actions").edit_user_cheatsheet,
  },
}
