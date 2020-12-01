Option.g({
	--[[
	#------------------------------------------------------------------------------#
	#                                    EDITOR                                    #
	#------------------------------------------------------------------------------#
	--]]
    shiftwidth = 4,
    tabstop = 4,
	hlsearch = false,
	foldlevelstart = 1,

	-- auto wrap after 80 characters in the line
	textwidth = 80,

	-- enable mouse in vim
	mouse = 'n',

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
})


Option.w({
	--[[
	#------------------------------------------------------------------------------#
	#                                    EDITOR                                    #
	#------------------------------------------------------------------------------#
	--]]
    number = true,
    relativenumber = true,

	-- code folding
    foldmethod = 'syntax',

})
