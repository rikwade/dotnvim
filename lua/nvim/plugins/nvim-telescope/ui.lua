local get = function(name)
    return vim.api.nvim_get_hl_by_name(name, true)
end

local set = vim.api.nvim_set_hl

local normal_hl = get('Normal')

local purple1 = '#333352'
local purple2 = '#232338'
local purple3 = '#12121c'
local red1 = '#ba3648'
local green1 = '#37ad39'
local blue1 = '#0985de'

----------------------------------------------------------------------
--                              Prompt                              --
----------------------------------------------------------------------
set(0, 'TelescopePromptBorder', {
    fg = purple3,
    bg = purple3,
})

set(0, 'TelescopePromptNormal', {
    fg = normal_hl.foreground,
    bg = purple3,
})

set(0, 'TelescopePromptTitle', {
    fg = normal_hl.foreground,
    bg = red1,
})

set(0, 'TelescopePromptCounter', {
    fg = red1,
    bg = purple3,
})

set(0, 'TelescopePromptPrefix', {
    fg = red1,
    bg = purple3,
})

----------------------------------------------------------------------
--                              Result                              --
----------------------------------------------------------------------
set(0, 'TelescopeResultsBorder', {
    fg = purple2,
    bg = purple2,
})

set(0, 'TelescopeResultsNormal', {
    fg = normal_hl.foreground,
    bg = purple2,
})

set(0, 'TelescopeResultsTitle', {
    fg = normal_hl.foreground,
    bg = blue1,
})

set(0, 'TelescopeSelectionCaret', {
    fg = blue1,
    bg = get('TelescopeSelection').background,
})

----------------------------------------------------------------------
--                             Preview                              --
----------------------------------------------------------------------

set(0, 'TelescopePreviewBorder', {
    fg = purple1,
    bg = purple1,
})

set(0, 'TelescopePreviewNormal', {
    fg = normal_hl.foreground,
    bg = purple1,
})

set(0, 'TelescopePreviewTitle', {
    fg = normal_hl.foreground,
    bg = green1,
})
