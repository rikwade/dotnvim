local Shortcut = require('nvim.utils.nvim.shortcut')

Shortcut():mode('n'):options():noremap():silent():next():keymaps({
    -- start debugging
    { '<leader>dd', ':call vimspector#Launch()<cr>' },

    -- reset the debug environment
    -- removes all the windows related to vimspector
    { '<leader>dD', ':call vimspector#Reset()<cr>' },

    -- stop debugging
    { '<leader>ds', ':call vimspector#Stop()<cr>' },

    -- restart the debugger
    { '<leader>dr', ':call vimspector#Restart()<cr>' },

    -- toggle breakpoint
    { '<leader>dt', ':call vimspector#ToggleBreakpoint()<cr>' },

    -- step into
    { '<leader>dl', ':call vimspector#StepInto()<cr>' },

    -- step out
    { '<leader>dh', ':call vimspector#StepOut()<cr>' },

    -- step over
    { '<leader>dj', ':call vimspector#StepOver()<cr>' },

    -- continue
    -- this will continue the execution unless there is a breakpoint
    { '<leader>dc', ':call vimspector#Continue()<cr>' },
})
