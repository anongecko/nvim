-- configs/suave.lua

local suave_config = {
  -- Uncomment and set the menu height if you want to customize it
  -- menu_height = 6,

  auto_save = {
    enabled = false, -- Disable auto-saving of sessions
  },

  store_hooks = {
    before_mksession = {
      -- Uncomment and customize these hooks if needed

      -- Example: Close the DAP UI before saving a session
      -- function ()
      --   require('dapui').close()
      -- end,

      -- Example: Close any open Neo-tree windows before saving a session
      -- function ()
      --   for _, w in ipairs(vim.api.nvim_list_wins()) do
      --     if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(w), 'ft') == 'neo-tree' then
      --       vim.api.nvim_win_close(w, false)
      --     end
      --   end
      -- end,
    },

    after_mksession = {
      -- This hook stores the current colorscheme in the session data
      function(data)
        data.colorscheme = vim.g.colors_name
      end,
    },
  },

  restore_hooks = {
    after_source = {
      -- This hook restores the colorscheme from the session data
      function(data)
        if not data then
          return
        end
        vim.cmd(string.format([[color %s | doau ColorScheme %s]], data.colorscheme, data.colorscheme))
      end,
    },
  },
}

-- Return the configuration table
return suave_config
