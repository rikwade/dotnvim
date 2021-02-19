local opts = { silent = true }

Keybind.g({
	-- start debugging
	{ 'n', ';dd', ':call vimspector#Launch()<cr>', opts },

	-- reset the debug environment
	-- removes all the windows related to vimspector
	{ 'n', ';dD', ':call vimspector#Reset()<cr>', opts },

	-- stop debugging
	{ 'n', ';ds', ':call vimspector#Stop()<cr>', opts },

	-- restart the debugger
	{ 'n', ';dr', ':call vimspector#Restart()<cr>', opts },

	-- toggle breakpoint
	{ 'n', ';t', ':call vimspector#ToggleBreakpoint()<cr>', opts },

	-- step into
	{ 'n', ';l', ':call vimspector#StepInto()<cr>', opts },

	-- step out
	{ 'n', ';h', ':call vimspector#StepOut()<cr>', opts },

	-- step over
	{ 'n', ';j', ':call vimspector#StepOver()<cr>', opts },

	-- continue
	-- this will continue the execution unless there is a breakpoint
	{ 'n', ';c', ':call vimspector#Continue()<cr>', opts },

})
