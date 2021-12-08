local api = vim.api

-- highlight the current cursor line
api.nvim_exec(
    [[
    " highlighting on yank
    au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=300, on_visual=true}
]],
    false
)
