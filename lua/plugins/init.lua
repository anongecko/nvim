return {
  -- Conform plugin for formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format { async = true }
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = require "configs.conform",
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- Lazy-load LSP upon opening a buffer
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- Linting plugin
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" }, -- Lazy-load linting upon opening a buffer
    config = function()
      require "configs.lint"
    end,
  },
  {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    require "configs.dap"
  end,
  },
  -- Trouble plugin for diagnostics
  {
    "folke/trouble.nvim",
    cmd = "Trouble", -- Lazy-load when the Trouble command is used
    config = function()
      require "configs.trouble"
    end,
  },

  -- CD Project plugin
  {
    "LintaoAmons/cd-project.nvim",
    cmd = {
      "CdProject",
      "CdProjectTab",
      "CdProjectAdd",
      "CdProjectBack",
      "CdProjectManualAdd",
      "CdSearchAndAdd",
    }, -- Lazy-load on any of these commands
    config = function()
      require "configs.cdproject"
    end,
  },

  -- Suave plugin for session management
  {
    "nyngwang/suave.lua",
    event = "VeryLazy", -- Lazy-load Suave on a very lazy event
    config = function()
      require "configs.suave"
    end,
  },

  -- Eagle plugin (no configuration provided)
  {
    "soulis-1256/eagle.nvim",
    event = "VeryLazy", -- Lazy-load Eagle on a very lazy event
  },

  -- Muren plugin for interactive search and replace
  {
    "AckslD/muren.nvim",
    cmd = { "MurenToggle" }, -- Lazy-load Muren toggle command
    config = function()
      require "configs.muren"
    end,
  },

  -- Neogit plugin for Git integration
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      { "nvim-telescope/telescope.nvim", optional = true },
    },
    cmd = { "Neogit", "Neogit commit" }, -- Lazy-load Neogit when these commands are run
    config = function()
      require "configs.neogit"
    end,
  },

  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "AerialToggle", "AerialOpen", "AerialInfo" },
    config = function()
      require "configs.aerial"
    end,
  },
}
