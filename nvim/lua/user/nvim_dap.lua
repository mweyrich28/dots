require('dap-python').setup('/home/malte/miniconda3/envs/uni/bin/python')
require('dap-go').setup()

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
    program = string.gsub(vim.fn.expand('%:p'),'%.%a+$', ''),
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = true,
  },
}
