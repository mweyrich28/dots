require('dap-python').setup('/usr/bin/python3')

local dap = require('dap')

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = '/home/malte/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',
        args = { "--port", "${port}" },
    }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = string.gsub(vim.fn.expand('%'),'%.%a+$', ''),
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = true,
  },
}
