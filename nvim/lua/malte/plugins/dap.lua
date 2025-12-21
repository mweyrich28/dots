return {
    'mfussenegger/nvim-dap-python',

    dependencies = {
        'mfussenegger/nvim-dap',
        'leoluz/nvim-dap-go',
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'nvim-telescope/telescope-dap.nvim',
        'nvim-neotest/nvim-nio'
    },

    config = function()
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
                program = string.gsub(vim.fn.expand('%:p'), '%.%a+$', ''),
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
                runInTerminal = true,
            },
        }

        local opts = {
            controls = {
                element = "repl",
                enabled = false,
                icons = {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = ""
                }
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
                border = "single",
                mappings = {
                    close = { "q", "<Esc>" }
                }
            },
            force_buffers = true,
            icons = {
                collapsed = "",
                current_frame = "",
                expanded = ""
            },
            layouts = {
                {
                    elements = {
                        {
                            id = "scopes",
                            size = 0.50
                        },
                        {
                            id = "stacks",
                            size = 0.30
                        },
                        {
                            id = "watches",
                            size = 0.10
                        },
                        {
                            id = "breakpoints",
                            size = 0.10
                        }
                    },
                    size = 40,
                    position = "left", -- Can be "left" or "right"
                },
                {
                    elements = {
                        "repl",
                        "console",
                    },
                    size = 10,
                    position = "bottom", -- Can be "bottom" or "top"
                }
            },
            mappings = {
                edit = "e",
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                repl = "r",
                toggle = "t"
            },
            render = {
                indent = 1,
                max_value_lines = 100
            }
        }

        require('dapui').setup(opts)

        dap.listeners.after.event_initialized["dapui_config"] = function()
            require('dapui').open()
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
            -- Commented to prevent DAP UI from closing when unit tests finish
            -- require('dapui').close()
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
            -- Commented to prevent DAP UI from closing when unit tests finish
            -- require('dapui').close()
        end
    end,

}
