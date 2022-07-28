local languages = {
    'lua',
}

local M = {}

function M.setup()
    for _, language in pairs(languages) do
        require(string.format('nvim.plugins.luasnip.snippets.%s', language)).setup()
    end
end

return M
