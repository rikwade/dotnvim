return function(highlights)
	return function(ns)
		ns = ns or 0

		for name, color_map in pairs(highlights) do
			vim.api.nvim_set_hl(ns, name, color_map)
		end
	end
end
