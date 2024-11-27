require("lint").linters_by_ft = {
  markdown = { "vale" },
  -- python = { "ruff", "mypy" }, Covered by Ruff in lspconfig.lua
  javascript = { "oxlint" },
  typescript = { "oxlint" },
  lua = { "selene" },
  json = { "jsonlint" },
  html = { "htmlhint" },
  cpp = { 'cpplint', 'trivy' }
}

-- Create an autocommand group for linting
local lint_augroup = vim.api.nvim_create_augroup("nvim_lint", { clear = true })

-- Define the autocommand for linting on file save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = lint_augroup,
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require("lint").try_lint()
  end,
})

-- Optionally, you can add a function to reset the linting autocommands
function _G.reset_linting_autocommands()
  vim.api.nvim_clear_autocmds { group = lint_augroup }
end
