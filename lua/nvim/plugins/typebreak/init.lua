vim.api.nvim_create_user_command('Typebreak', function()
    require('typebreak').start()
end, {})
