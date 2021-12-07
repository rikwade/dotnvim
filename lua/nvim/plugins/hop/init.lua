R('hop').setup({ keys = 'tnseriaocmfuplwyq' })

local opt = { silent = true }

Keybind.g({
    { 'n', '8f', ':HopChar1<CR>', opt },
    { 'n', '8w', ':HopWord<CR>', opt },
})
