Option.g({
	--[[
	#------------------------------------------------------------------------------#
	#                                    EDITOR                                    #
	#------------------------------------------------------------------------------#
	--]]
    tabstop = 4,
    shiftwidth = 4,
	hlsearch = false,
	foldlevelstart = 1,

	-- auto wrap after 80 characters in the line
	textwidth = 80,

	-- enable mouse in vim
	mouse = 'n',

	-- delete backup when after write to file
	backup = false,

	-- create backup file but when backup is off, it will be deleted on write
	writebackup = false,

    -- write changes to swap file after 300ms
	updatetime = 300,

	-- don't show messages related to completion menu
	shortmess = vim.o.shortmess .. 'c',

    -- open completion menu even for single item
	-- do not auto insert items from completion menu
	-- @warning - preview is removed. when it's on, default lsp opens a vertical tab
	completeopt = 'menuone,noinsert,noselect',


	--[[
	#------------------------------------------------------------------------------#
	#                                    EDITING                                   #
	#------------------------------------------------------------------------------#
	--]]
	smartcase = true,
	ignorecase = true,

	-- shows the effects of a command incrementally
	inccommand = 'nosplit',
	splitright = true,
	splitbelow = true,

	-- hide unsaved file when closing the buffer
	-- usually vim doesn't allow closing unsaved buffer unless you force it
	-- but with hidden option, buffer will be hidden when you close it
	-- vim will prompt you to save when closing vim editor
	hidden = true,

	--[[
	#------------------------------------------------------------------------------#
	#                                      UI                                      #
	#------------------------------------------------------------------------------#
	--]]
	background = 'dark',
	termguicolors = true,

	--[[
	#------------------------------------------------------------------------------#
	#                                     OTHER                                    #
	#------------------------------------------------------------------------------#
	--]]
	-- assign unnamedplus register to clipboard
	-- anything in the clipboard can be pasted directly
	-- any yanked text will be copied to clipboard
	clipboard='unnamedplus',
})


Option.w({
	--[[
	#------------------------------------------------------------------------------#
	#                                    EDITOR                                    #
	#------------------------------------------------------------------------------#
	--]]
	-- shows the number bar in left hand side of the window
    number = true,
    relativenumber = true,

	-- code folding method to syntax
	-- common methods will be used such as curly braces 
    foldmethod = 'syntax',

	-- error signs and warnings will be displayed in the number line
	-- usually it adds new column when signs, moving buffer to right side.
	-- adding a column create weird effect that's little bit hard for the eye
	signcolumn = 'number',

	-- vim try to keep 100 lines below and above when scrolling
	-- if buffer cannot display more than 200 lines, cursor will stay in center
	-- and scroll the buffer
	scrolloff=100
})

Option.b({
    shiftwidth = 4,
})
