local Shortcut = require('nvim.utils.nvim.shortcut')
local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')
local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')

local neotree_highlights = HighlightGroups({
    NeoTreeModified = 'guifg=#ff0550',

    -- git colors
    NeoTreeGitAdded = 'guifg=#05a312',
    NeoTreeGitDeleted = 'guifg=#ff845e',
    NeoTreeGitRenamed = 'guifg=#838518',
    NeoTreeGitConflict = 'guifg=#7e73ff',
    NeoTreeGitUntracked = 'guifg=#ff0550',
    NeoTreeGitModified = 'guifg=#ffea63',
    NeoTreeGitModified_35 = 'guifg=#c98216',
    NeoTreeGitModified_60 = 'guifg=#966111',
    NeoTreeGitModified_68 = 'guifg=#6e4404',
})

Highlighter:new():add(neotree_highlights):register_highlights()

require('neo-tree').setup({

    filesystem = {
        window = {
            mappings = {
                ['o'] = 'open',
            },
        },
        renderers = {
            directory = {
                {
                    'icon',
                    default = '',
                    folder_closed = ' ',
                    folder_open = ' ',
                    padding = ' ',
                },
                { 'current_filter' },
                { 'name' },
                {
                    'clipboard',
                    highlight = 'NeoTreeDimText',
                },
                { 'diagnostics', errors_only = true },
            },
        },
    },
    default_component_configs = {
        modified = {
            symbol = '',
            highlight = 'NeoTreeModified',
        },
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = 'NeoTreeFileName',
        },
        git_status = {
            symbols = {
                -- Change type
                added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
                deleted = '✖', -- this can only be used in the git_status source
                renamed = '', -- this can only be used in the git_status source
                -- Status type
                untracked = '',
                ignored = '',
                unstaged = '',
                staged = '',
                conflict = '',
            },
        },
    },
})

Shortcut():options():noremap():next():mode('n'):keymaps({
    { '\\', ':NeoTreeFocusToggle<cr>' },
    {
        ',,',
        function()
            vim.cmd('NeoTreeReveal')
            vim.cmd('NeoTreeFocus')
        end,
    },
})
