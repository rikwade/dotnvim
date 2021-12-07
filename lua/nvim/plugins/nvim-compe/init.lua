R('compe').setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'always',
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = {
        border = { '', '', '', ' ', '', '', '', ' ' },
        winhighlight = 'NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder',
        max_width = 120,
        min_width = 60,
        max_height = math.floor(V.o.lines * 0.3),
        min_height = 1,
    },

    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = false,
        ultisnips = false,
        luasnip = false,
    },
})

local function on_attach(bufnr)
    local opt = { silent = true, expr = true, noremap = false }
    Keybind.b({
        { bufnr, 'i', '<c-space>', 'compe#complete()', opt },
        { bufnr, 'i', '<CR>', 'compe#confirm(\'<CR>\')', opt },
    })
end

return { on_attach = on_attach }
