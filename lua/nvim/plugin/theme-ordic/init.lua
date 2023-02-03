return {
	'AlexvZyl/nordic.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		require 'nordic'.setup {
			telescope = {
				style = 'flat',
			},
			bold_keywords = false,
			italic_comments = true,
			transparent_bg = false,
			override = {},
			cursorline = {
				bold = false,
				theme = 'light',
			},
		}

		require 'nordic'.load()
	end
}
