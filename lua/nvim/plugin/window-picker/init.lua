local path = '/home/s1n7ax/Workspace/nvim/nvim-window-picker'

return {
	's1n7ax/nvim-window-picker',
	name = 'window-picker',
	event = 'VeryLazy',
	version = '1.*',
	dev = vim.fn.isdirectory(path),
	dir = path,
	config = true,
}
