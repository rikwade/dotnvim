local Shortcut = require('nvim.utils.nvim.shortcut')

local Lsp = require('nvim.utils.lsp')
local Event = require('nvim.utils.lsp.event')
local ConfEvent = require('nvim.utils.lsp.config.event')

local saga = require('lspsaga')
local finder = require('lspsaga.finder')
local action = require('lspsaga.codeaction')
local hover = require('lspsaga.hover')
local signaturehelp = require('lspsaga.signaturehelp')
local rename = require('lspsaga.rename')
local definition = require('lspsaga.definition')
local diagnostic = require('lspsaga.diagnostic')
-- local implement = require('lspsaga.implement')

saga.init_lsp_saga({

    -- Options with default value
    -- "single" | "double" | "rounded" | "bold" | "plus"
    border_style = 'single',
    --the range of 0 for fully opaque window (disabled) to 100 for fully
    --transparent background. Values between 0-30 are typically most useful.
    saga_winblend = 0,
    -- when cursor in saga window you config these to move
    move_in_saga = { prev = 'e', next = 'n' },
    -- Error, Warn, Info, Hint
    -- use emoji like
    -- { "🙀", "😿", "😾", "😺" }
    -- or
    -- { "😡", "😥", "😤", "😐" }
    -- and diagnostic_header can be a function type
    -- must return a string and when diagnostic_header
    -- is function type it will have a param `entry`
    -- entry is a table type has these filed
    -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
    diagnostic_header = { ' ', ' ', ' ', 'ﴞ ' },
    -- show diagnostic source
    show_diagnostic_source = true,
    -- add bracket or something with diagnostic source, just have 2 elements
    diagnostic_source_bracket = {},
    -- preview lines of lsp_finder and definition preview
    max_preview_lines = 20,
    -- use emoji lightbulb in default
    code_action_icon = '💡',
    -- if true can press number to execute the codeaction in codeaction window
    code_action_num_shortcut = true,
    -- same as nvim-lightbulb but async
    code_action_lightbulb = {
        enable = false,
        sign = false,
        enable_in_insert = true,
        sign_priority = 20,
        virtual_text = true,
    },
    -- finder icons
    finder_icons = {
        def = '  ',
        ref = '諭 ',
        link = '  ',
    },
    -- custom finder title winbar function type
    -- param is current word with symbol icon string type
    -- return a winbar format string like `%#CustomFinder#Test%*`
    -- finder_title_bar = function(param) do your stuff here end,
    finder_action_keys = {
        open = 'o',
        vsplit = 's',
        split = 'i',
        tabe = 't',
        quit = 'q',
        scroll_down = '<c-d>',
        scroll_up = '<c-u>', -- quit can be a table
    },
    code_action_keys = {
        quit = 'q',
        exec = '<CR>',
    },
    rename_action_quit = '<C-c>',
    rename_in_select = true,
    definition_preview_icon = '  ',
    -- show symbols in winbar must nightly
    symbol_in_winbar = {
        in_custom = false,
        enable = false,
        separator = ' ',
        show_file = true,
        click_support = false,
    },
    -- show outline
    show_outline = {
        win_position = 'right',
        --set special filetype win that outline window split.like NvimTree neotree
        -- defx, db_ui
        win_with = '',
        win_width = 30,
        auto_enter = true,
        auto_preview = true,
        virt_text = '┃',
        jump_key = 'o',
        -- auto refresh when change buffer
        auto_refresh = true,
    },
    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = { metals = { "sbt", "scala" } }
    server_filetype_map = {}, -- your configuration
})

local M = {}

function M.on_attach(_, buffer)
    Log.ins(buffer)

    Shortcut():mode('n'):options():buffer(buffer):next():keymaps({
        { '<leader>t', finder.lsp_finder },
        -- { '<leader>s', implement.lspsaga_implementation },
        { '<leader>a', action.code_action },
        { '<leader>v', hover.render_hover_doc },
        { '<leader>w', signaturehelp.signature_help },
        { '<leader>r', rename.lsp_rename },
        { '<leader>q', definition.preview_definition },
        { '<leader>d', diagnostic.show_line_diagnostics },
        { ']d', diagnostic.goto_next },
        { '[d', diagnostic.goto_prev },
    })

    Shortcut():mode('v'):options():buffer(buffer):next():keymaps({
        -- range code action
        {
            '<leader>v',
            function()
                vim.fn.feedkeys(
                    vim.api.nvim_replace_termcodes('<C-U>', true, false, true)
                )
                action.range_code_action()
            end,
        },
    })
end

function M.setup()
    Lsp.add_listener(Event.SERVER_SETUP, function(_, conf)
        conf:add_listener(ConfEvent.ATTACH, M.on_attach)
        return conf
    end)
end

return M
