-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = require "lspconfig.util"
local servers = { "html", "cssls", "tsserver", "lua_ls", "pyright", "clangd"} -- Add pyright to the list of servers
local nvlsp = require "nvchad.configs.lspconfig"

-- Function to find project root directory
local function find_root_dir(fname)
  return util.root_pattern("venv", "pyproject.toml", "setup.py", ".git", "main.py", "requirements.txt")(fname)
    or vim.fn.getcwd()
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    root_dir = find_root_dir,
  }
end

lspconfig.clangd.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = find_root_dir,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--fallback-style=llvm",
    "--query-driver=/usr/bin/clang++,/opt/homebrew/opt/llvm/bin/clang++"
  },
  init_options = {
    fallbackFlags = { "-std=c++20" },
    compilationDatabasePath = vim.fn.expand('~/.config/clangd'),
  }
}

-- Configuration for pyright (replacing basedpyright)
lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = find_root_dir,
  settings = {
    python = {
      analysis = {
        useLibraryCodeForTypes = true,
        autoSearchPaths = true, -- Automatically search for type stubs
        diagnosticMode = "workspace",
        typeCheckingMode = "basic", -- Adjust type checking mode as needed
      },
    },
  },

  -- before_init function to set the Python path from the virtual environment
  before_init = function(_, config)
    local venv_path = util.path.join(config.root_dir, "venv")
    local python_path = util.path.join(venv_path, "bin", "python")

    config.settings.python.venv = venv_path -- Set the venv path for pyright

    -- Print information for debugging
    print("Venv path:", venv_path)

    local handle = io.popen(python_path .. ' -c "import sys; print(sys.path)"')
    if handle then
      local result = handle:read "*a"
      handle:close()
      print "Python sys.path:"
      print(result)
    else
      print "Failed to run Python to get sys.path"
    end
  end,
}
