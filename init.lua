for k in pairs(package.loaded) do if k:match("nvim") then package.loaded[k] = nil end end
require('nvim')

--[[
augroup CocGroup
  autocmd!
  autocmd BufNew,BufEnter *.py execute "silent! CocDisable"
augroup end
]]

