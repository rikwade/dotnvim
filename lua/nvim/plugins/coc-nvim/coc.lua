local Pum = R 'nvim.utils.'

local v = vim
local a = vim.api
local e = vim.api.nvim_eval
local c = vim.cmd

local Coc = {}

Coc.is_rpc_ready = function() return e('coc#rpc#ready()') > 0 end

Coc.select_completion_item = function(org_input)
    if Pum.is_visible() then
        e('coc#_select_confirm()')
    else
        a.nvim_input(org_input)
    end
end

Coc.show_documentation = function()
    local filetype = v.bo.filetype

    if filetype == 'vim' or filetype == 'help' then
        local cword = e('expand("<cword>")')
        c('help ' .. cword)
    elseif Coc.is_rpc_ready() then
        e('CocActionAsync(\'doHover\')')
    else
        -- following will run "man" in vim
        local keywordprg = v.o.keywordprg
        local cword = e('expand("<cword>")')
        c(string.format('%s %s', keywordprg, cword))
    end
end

return Coc
