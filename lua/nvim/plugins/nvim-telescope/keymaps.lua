local builtin = require('telescope.builtin')
local wk = require('which-key')

local function vsp(func)
    return function()
        func({
            jump_type = 'vsplit',
        })
    end
end

wk.register({
    name = 'Finder',
    n = { builtin.grep_string, 'Find word under cursor' },
    e = { builtin.find_files, 'Find files' },
    t = { builtin.live_grep, 'Find text' },
    i = { builtin.buffers, 'Find buffers' },
    s = { builtin.current_buffer_fuzzy_find, 'Find line' },
    o = { builtin.resume, 'Find last search' },
}, { prefix = '<leader>n' })

wk.register({
    ['<c-r>'] = { builtin.registers, 'Show registers' },
}, {
    mode = 'i',
})

local reg_lsp_keymaps = function(buffer)
    wk.register({
                name = 'LSP',
                s = {
                    vsp(builtin.lsp_implementations),
                    'Go to implementation (split)',
                },
                S = { builtin.lsp_implementations, 'Go to implementation' },
                n = {
                    vsp(builtin.lsp_definitions),
                    'Go to definition (split)',
                },
                N = { builtin.lsp_definitions, 'Go to definition' },
                c = { builtin.diagnostics, 'Show all diagnostics' },
    }, {
        buffer = buffer,
        prefix = '<leader>t'
    })
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(arg)
        local buffer = arg.buf
        reg_lsp_keymaps(buffer)
    end,
    group = vim.api.nvim_create_augroup('Telescope lsp keymaps', {}),
})
