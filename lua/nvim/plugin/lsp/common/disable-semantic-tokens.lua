local M = {}

function M.setup()
	vim.api.nvim_create_autocmd('LspAttach', {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			client.server_capabilities.semanticTokensProvider = nil
		end,

		group = vim.api.nvim_create_augroup('disable-semantic-tokens', {}),
	})
end

return M
