require('init')
--[[
augroup CocGroup
  autocmd!
  autocmd BufNew,BufEnter *.py execute "silent! CocDisable"
augroup end
]]

