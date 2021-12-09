local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')

local test_highlight_groups = HighlightGroups({
    TestPending = 'guifg=#383838',
    TestPassed = 'guifg=#289c38',
    TestSkipped = 'guifg=#a38034',
    TestError = 'guifg=#b33232',
})

return test_highlight_groups
