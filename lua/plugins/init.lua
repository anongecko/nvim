return {
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

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    lazy = true,
    config = function()
      require "configs.lint"
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require "configs.trouble"
    end,
  },

  {
    "LintaoAmons/cd-project.nvim",
    config = function()
      require "configs.cdproject"
    end,
  },

  {
    "doctorfree/cheatsheet.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require "configs.cheatsheet"
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require "configs.ufo"
    end,
  },

  {
    "nyngwang/suave.lua",
    config = function()
      require "configs.suave"
    end,
  },

  {
    "soulis-1256/eagle.nvim",
  },
}
