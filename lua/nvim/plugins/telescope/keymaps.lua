local Shortcut = require('nvim.utils.nvim.shortcut')
local builtin = require('telescope.builtin')
local finder = require("lspsaga.finder")

local function with_vsplit(func)
    return function()
        func({
            jump_type = 'vsplit',
        })
    end
end

Shortcut()
    :mode('n')
    :options()
    :noremap()
    :next()
    :keymaps({
        ----------------------------------------------------------------------
        --                          FILES & BUFFER                          --
        ----------------------------------------------------------------------
        -- find a file in current working directory
        { '<leader>n', builtin.find_files },

        -- find line in current working directory
        { '<leader>e', builtin.live_grep },

        -- find buffer
        { '<leader>i', builtin.buffers },

        -- find line in current buffer
        { '<leader>o', builtin.current_buffer_fuzzy_find },

        -- find word under the cursor in current buffer
        { '<leader>*', builtin.grep_string },

        -- find help index
        { '<leader>m', builtin.help_tags },

        -- resumes the previous search
        { '<leader>k', builtin.resume },

        ----------------------------------------------------------------------
        --                               LSP                                --
        ----------------------------------------------------------------------
        -- browse code implementation
        { '<leader>s', builtin.lsp_implementations },

        -- -- find diagnostics in the file
        { '<leader>c', builtin.diagnostics },
    })
    :mode('i')
    :options()
    :noremap()
    :next()
    :keymaps({
        -- find register by containing value
        { '<c-r>', builtin.registers },
    })
