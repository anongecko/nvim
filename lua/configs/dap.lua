local dap = require("dap")
local dapui = require("dapui")

-- Setup dapui
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings at once
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- size = 10,
  -- Elements to show on startup
  elements = {
    -- Provide as IDs or tables with "id" field set
    { id = "scopes", size = 0.25 },
    { id = "breakpoints", size = 0.25 },
    { id = "stacks", size = 0.25 },
    { id = "watches", size = 0.25 },
  },
  layout = {
    {
      elements = {
        -- Elements can be strings or tables with "id" field set
        { id = "scopes", size = 0.25 },
        "stacks",
        "breakpoints",
        "watches",
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be nil or a number
  },
})

-- Setup dap
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Setup dap configurations
dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/usr/bin/cppdbg",
  args = { "-stdin" },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "enable pretty printing",
        ignoreFailures = false,
      },
    },
  },
}

