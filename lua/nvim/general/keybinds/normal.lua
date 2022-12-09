local common = require('nvim.utils.common.module')
local window = require('nvim.utils.nvim.window')
local wk = require('which-key')

----------------------------------------------------------------------
--                              CONFIG                              --
----------------------------------------------------------------------
wk.register({
    r = {
        function()
            common.reload_package('nvim')
        end,
        'Reload config',
    },
}, {
    prefix = '<tab>',
})

----------------------------------------------------------------------
--                           CURSOR MOVE                            --
----------------------------------------------------------------------
wk.register({
    ['<c-m>'] = { '<c-w>h', 'Jump left window' },
    ['<c-i>'] = { '<c-w>l', 'Jump right window' },
    ['<c-n>'] = { '<c-w>j', 'Jump bottom window' },
    ['<c-e>'] = { '<c-w>k', 'Jump top window' },
    ['<c-w><c-w>'] = { '<c-w>p', 'Jump to last window' },

    ["''"] = { '``', 'Jump to last jump point' },

    ['0'] = { '^', 'Jump to line start (non-blank)' },

    -- centering the cursor after action
    ['{'] = { '{zz', 'Previous empty line' },
    ['}'] = { '}zz', 'Next empty line' },
    ['<c-l>'] = { '<c-i>', 'Jump prev jump point' },
}, {})

----------------------------------------------------------------------
--                        BUFFER READ WRITE                         --
----------------------------------------------------------------------
wk.register({
    [',w'] = { '<cmd>silent w<cr>', 'Save file' },
    [',q'] = { '<cmd>q<cr>', 'Close window' },
    [',Q'] = { '<cmd>tabclose<cr>', 'Close tab' },
})

----------------------------------------------------------------------
--                      BUFFER & WINDOW SWITCH                      --
----------------------------------------------------------------------
wk.register({
    gf = {
        function()
            require('nvim.utils.nvim.file').open_file_under_cursor()
        end,
        'Open file on cursor',
    },

    gF = { 'gf', 'Open file on cursor (same window)' },
})

----------------------------------------------------------------------
--                           SPLIT WINDOW                           --
----------------------------------------------------------------------
wk.register({
    ['<tab>h'] = { window.split_left, 'Split left' },
    ['<tab>n'] = { window.split_bottom, 'Split bottom' },
    ['<tab>e'] = { window.split_top, 'Split top' },
    ['<tab>i'] = { window.split_right, 'Split right' },
})

----------------------------------------------------------------------
--                              OTHER                               --
----------------------------------------------------------------------
wk.register({
    -- to go enable spell checker
    ['<F6>'] = { '<cmd>setlocal spell! spelllang=en_us<cr>', 'Toggle spell' },
})
