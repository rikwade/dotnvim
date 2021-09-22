local l = Keybind.get_lua_cmd_string

local opt = {
    noremap = true,
    expr = true,
    silent = true,
    nowait = true,
}

local silent_opt = {
    silent = true,
}

local none = {}

Keybind.g(
    {

        -- code jumps
        { 'n', 'gd', '<Plug>(coc-definition)', silent_opt },
        { 'n', 'gi', '<Plug>(coc-implementation)', silent_opt },
        { 'n', 'gr', '<Plug>(coc-references)', silent_opt },
        { 'n', 'gt', '<Plug>(coc-type-definition)', silent_opt },
        { 'n', 'K', l 'Coc.show_documentation()', silent_opt },

        -- error jumps
        { 'n', '<leader>j', '<Plug>(coc-diagnostic-next)', silent_opt },
        { 'n', '<leader>k', '<Plug>(coc-diagnostic-prev)', silent_opt },

        -- actions
        { 'n', '<leader>r', '<Plug>(coc-rename)', silent_opt },
        { 'n', '<leader>a', '<Plug>(coc-codeaction)', silent_opt },
        { 'n', '<leader>s', '<Plug>(coc-codeaction-selected)', silent_opt },
        { 'n', '<leader>qf', '<Plug>(coc-fix-current)', silent_opt },
        { 'n', '<leader>f', l 'vim.fn.CocAction("format")', none },

        -- text objects
        { 'x', 'if', '<Plug>(coc-funcobj-i)', silent_opt },
        { 'o', 'if', '<Plug>(coc-funcobj-i)', silent_opt },
        { 'x', 'af', '<Plug>(coc-funcobj-a)', silent_opt },
        { 'o', 'af', '<Plug>(coc-funcobj-a)', silent_opt },

        { 'x', 'ic', '<Plug>(coc-classobj-i)', silent_opt },
        { 'o', 'ic', '<Plug>(coc-classobj-i)', silent_opt },
        { 'x', 'ac', '<Plug>(coc-classobj-a)', silent_opt },
        { 'o', 'ac', '<Plug>(coc-classobj-a)', silent_opt },

        -- completion
        { 'i', '<c-space>', 'coc#refresh()', opt },
    })

API.nvim_exec(
    [[

	" Add `:Format` command to format current buffer.
	command! -nargs=0 Format :call CocAction('format')

	" Add `:Fold` command to fold current buffer.
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" Add `:OR` command for organize imports of the current buffer.
	command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

	inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

	if has('nvim')
	  inoremap <silent><expr> <c-space> coc#refresh()
	else
	  inoremap <silent><expr> <c-@> coc#refresh()
	endif

]], false)
