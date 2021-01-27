package.loaded['nvim'] = nil
require('nvim')

--[[
augroup CocGroup
  autocmd!
  autocmd BufNew,BufEnter *.py execute "silent! CocDisable"
augroup end
]]

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}

-- vim.api.nvim_command('colorscheme gruvbuddy')
-- require('colorbuddy').colorscheme('onebuddy')
vim.api.nvim_command('colorscheme embark')
