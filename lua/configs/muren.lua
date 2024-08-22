-- configs/muren.lua

require("muren").setup {
  -- General settings
  create_commands = true, -- Set to false if you don't want the commands to be automatically created
  filetype_in_preview = true,

  -- Default togglable options
  two_step = false, -- Set to true if you want to enable the two-step replacement mode by default
  all_on_line = true,
  preview = true,
  cwd = false, -- Set to true if you want to default to the current working directory
  files = "**/*", -- Files to include in the search

  -- Keymaps
  keys = {
    close = "q",
    toggle_side = "<Tab>",
    toggle_options_focus = "<C-s>",
    toggle_option_under_cursor = "<CR>",
    scroll_preview_up = "<Up>",
    scroll_preview_down = "<Down>",
    do_replace = "<C-A-S-r>",
    do_undo = "<localleader>u",
    do_redo = "<localleader>R",
  },

  -- UI sizes
  patterns_width = 30,
  patterns_height = 10,
  options_width = 20,
  preview_height = 12,

  -- Window positions
  anchor = "center", -- Set to your preferred position
  vertical_offset = 0,
  horizontal_offset = 0,

  -- Options order in UI
  order = {
    "buffer",
    "dir",
    "files",
    "two_step",
    "all_on_line",
    "preview",
  },

  -- Highlights used for options UI
  hl = {
    options = {
      on = "@string", -- Highlight group for enabled options
      off = "@variable.builtin", -- Highlight group for disabled options
    },
    preview = {
      cwd = {
        path = "Comment",
        lnum = "Number",
      },
    },
  },
}
