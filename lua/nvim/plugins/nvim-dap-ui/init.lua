local dap, dapui = require('dap'), require('dapui')
local Shortcut = require('nvim.utils.nvim.shortcut')
local Command = require('nvim.utils.nvim.command')

Command():add_all({
    { name = 'Dap', action = dapui.toggle },
})

Shortcut():mode('n'):options():noremap():silent():next():keymaps({
    { '<leader><leader>t', dapui.toggle },
})

-- Auto launching the dap ui configuration on dap init
dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

dapui.setup({
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = ';',
        repl = 'r',
        toggle = 't',
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    ---@diagnostic disable-next-line: undefined-global
    expand_lines = vim.fn.has('nvim-0.7'),
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position.
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                'breakpoints',
                'stacks',
                'watches',
                'repl',
            },
            size = 40,
            position = 'left',
        },
        {
            open_on_start = true,
            elements = { 'console' },
            size = 10,
            position = 'bottom',
        },
    },

    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = 'single', -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { 'q', '<Esc>', '<c-c>' },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
    },
})
