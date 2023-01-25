local ls = require('luasnip')

local languages = {
	'lua',
	'javascript',
	'javascriptreact',
	'yaml',
	'java',
}

local M = {}

function M.register_snippets()
	for _, language in pairs(languages) do
		require(string.format('nvim.plugin.luasnip.snippets.%s', language)).setup()
	end
end

function M.set_highlights()
	local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')
	local HighlightGroups = require(
		'nvim.utils.nvim.highlighting.highlight-groups'
	)
	local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')

	local theme = ThemeManager.get_theme()

	local highlighter = Highlighter:new():add(HighlightGroups({
		LuaSnipChoiseNode = { guifg = theme.bright.yellow },
		LuaSnipActiveNode = { guifg = theme.bright.green },
	}))

	highlighter:register_highlights()
end

function M.register_keymaps()
	local wk = require('which-key')

	wk.register({
		['<c-i>'] = { M.expand_or_jump, '(Snippet) Expand or jump' },
		['<c-h>'] = { M.jump_next, '(Snippet) Jump next placeholder' },
		['<c-n>'] = { M.jump_prev, '(Snippet) Jump prev placeholder' },
		['<c-l>'] = { M.change_choice, '(Snippet) Change choice' },
	}, { mode = { 'i', 's' } })

	wk.register({
		['<leader><leader>tq'] = { M.refresh_snippets, '(Snippet) refresh' },
	})
end

function M.expand_or_jump()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end

function M.jump_next()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end

function M.jump_prev()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end

function M.change_choice()
	if ls.choice_active() then
		ls.change_choice()
	end
end

function M.refresh_snippets()
	local module = require('nvim.utils.common.module')

	module.unload_package('ts-utils')
	module.unload_package('snips')
	module.unload_package('nvim.plugin.luasnip')

	ls.cleanup()

	M.register_snippets()
end

return M
