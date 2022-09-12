local Command = require('nvim.utils.nvim.new-command')
local spread = require('spread')

Command:new():add_all({
    {
        'SpreadParam',
        spread.out,
        { desc = 'Spread parameters to multi-lines' },
    },
    {
        'SpreadParamCollapse',
        spread.combine,
        { desc = 'Collapse multi-line parameters to one line' },
    },
})
