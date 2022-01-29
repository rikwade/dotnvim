local Shortcut = require('nvim.utils.nvim.shortcut')
local CmdString = require('nvim.utils.nvim.command-string')

local l = CmdString.get_lua_cmd_string

local builtin = function(function_name)
    local cmd = 'require"telescope.builtin".' .. function_name
    return l(cmd)
end

Shortcut:mode('n'):options():noremap():next():keymaps({
    ----------------------------------------------------------------------
    --                          FILES & BUFFER                          --
    ----------------------------------------------------------------------
    -- find a file in current working directory
    { '<leader>tn', builtin('find_files()') },

    -- find line in current working directory
    { '<leader>te', builtin('live_grep()') },

    -- resumes the previous search
    { '<leader>ti', builtin('resume()') },

    -- find buffer
    { '<leader>to', builtin('buffers()') },

    -- find line in current buffer
    { '<leader>tt', builtin('current_buffer_fuzzy_find()') },

    -- find word under the cursor in current buffer
    { '<leader>*', builtin('grep_string()') },

    -- find help index
    { '<leader>ts', builtin('help_tags()') },

    ----------------------------------------------------------------------
    --                               LSP                                --
    ----------------------------------------------------------------------
    -- find references of word under the cursor
    { '<leader>nm', builtin('lsp_references()') },

    -- find diagnostics in the file
    { '<leader>nd', builtin('lsp_document_diagnostics()') },

    -- show code actions
    -- { '<leader>a', builtin('lsp_range_code_actions()') },

    -- browse code definition
    { '<leader>nt', builtin('lsp_definitions()') },

    -- browse code implementation
    { '<leader>ns', builtin('lsp_implementations()') },
})

Shortcut:mode('i'):options():noremap():next():keymaps({
    -- find register by containing value
    { '<c-r>', builtin('registers()') },
})

--[[
  loclist = <function 25>,
  lsp_code_actions = <function 26>,
  lsp_definitions = <function 27>,
  lsp_document_diagnostics = <function 28>,
  lsp_document_symbols = <function 29>,
  lsp_dynamic_workspace_symbols = <function 30>,
  lsp_implementations = <function 31>,
  lsp_range_code_actions = <function 32>,
  lsp_references = <function 33>,
  lsp_type_definitions = <function 34>,
  lsp_workspace_diagnostics = <function 35>,
  lsp_workspace_symbols = <function 36>,
  --]]


