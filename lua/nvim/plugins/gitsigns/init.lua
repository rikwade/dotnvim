local CmdString = require('nvim.utils.nvim.command-string')

local l = CmdString.get_lua_cmd_string

string.format('&diff ? "]c" : %s', l('require"gitsigns.actions".next_hunk()'))

require('gitsigns').setup({
    numhl = false,
    linehl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,

        ['n ]c'] = {
            expr = true,
            string.format(
                '&diff ? "]c" : %s',
                l('require"gitsigns.actions".next_hunk()')
            ),
        },
        ['n [c'] = {
            expr = true,
            string.format(
                '&diff ? "]c" : %s',
                l('require"gitsigns.actions".prev_hunk()')
            ),
        },

        --  ['n <leader>hs'] = l 'require"gitsigns".stage_hunk()',
        --  ['v <leader>hs'] = l 'require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})',
        --  ['n <leader>hu'] = l 'require"gitsigns".undo_stage_hunk()',
        --  ['n <leader>hr'] = l 'require"gitsigns".reset_hunk()',
        --  ['v <leader>hr'] = l 'require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})',
        --  ['n <leader>hR'] = l 'require"gitsigns".reset_buffer()',
        --  ['n <leader>hp'] = l 'require"gitsigns".preview_hunk()',
        --  ['n <leader>hb'] = l 'require"gitsigns".blame_line(true)',

        -- Text objects
        --  ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
        --  ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    },
    watch_gitdir = { interval = 1000, follow_files = true },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    word_diff = false,
    diff_opts = {
        internal = true,
    },
    current_line_blame_opts = {
        delay = 1000,
        text_position = 'eol',
    },
})
