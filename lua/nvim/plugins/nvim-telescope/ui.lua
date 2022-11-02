local get = function(name)
    return vim.api.nvim_get_hl_by_name(name, true)
end

local set = vim.api.nvim_set_hl

local normal_hl = get('Normal')

local blue1 = '#333352'
local blue2 = '#232338'
local blue3 = '#12121c'
local red1 = '#ba3648'
local green1 = '#2b8f03'
local orange1 = '#c28234'

----------------------------------------------------------------------
--                              Prompt                              --
----------------------------------------------------------------------
set(0, 'TelescopePromptBorder', {
    fg = blue3,
    bg = blue3,
})

set(0, 'TelescopePromptNormal', {
    fg = normal_hl.foreground,
    bg = blue3,
})

set(0, 'TelescopePromptTitle', {
    fg = normal_hl.foreground,
    bg = red1,
})

set(0, 'TelescopePromptCounter', {
    fg = red1,
    bg = blue3,
})

set(0, 'TelescopePromptPrefix', {
    fg = red1,
    bg = blue3,
})

----------------------------------------------------------------------
--                              Result                              --
----------------------------------------------------------------------
set(0, 'TelescopeResultsBorder', {
    fg = blue2,
    bg = blue2,
})

set(0, 'TelescopeResultsNormal', {
    fg = normal_hl.foreground,
    bg = blue2,
})

set(0, 'TelescopeResultsTitle', {
    fg = normal_hl.foreground,
    bg = orange1,
})

set(0, 'TelescopeSelectionCaret', {
    fg = orange1,
    bg = get('TelescopeSelection').background,
})

----------------------------------------------------------------------
--                             Preview                              --
----------------------------------------------------------------------

set(0, 'TelescopePreviewBorder', {
    fg = blue1,
    bg = blue1,
})

set(0, 'TelescopePreviewNormal', {
    fg = normal_hl.foreground,
    bg = blue1,
})

set(0, 'TelescopePreviewTitle', {
    fg = normal_hl.foreground,
    bg = green1,
})
