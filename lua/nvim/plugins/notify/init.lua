local notify = require('notify')

notify.setup({
    timeout = 2000,
})

vim.notify = notify
