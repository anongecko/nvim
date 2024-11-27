local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff" },
        javascript = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        typescript = { "prettierd" },
        json = { "biome" },
        c = { "clang-format" },
        cpp = { "clang-format" },
    },

    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = false,
        enabled = true,
    },

    formatters = {
        shfmt = {
            prepend_args = { "-i", "2" },
        },
        prettierd = {
            env = {
                PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.prettierrc"),
            },
        },
        biome = {
            -- You can add any specific configurations for biome here if needed
        },
    },
})

-- Create an autocmd to format files on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        require("conform").format { async = true }
    end,
})

return conform.formatters_by_ft
