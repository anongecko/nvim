local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "ruff" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    css = { "prettier" },
    html = { "prettier" },
    typescript = { "biome" },
    json = { "biome" },
  },

  default_format_opts = {
    lsp_format = "fallback",
  },

  format_on_save = {
    timeout_ms = 500,
  },

  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
  },
}

return options
