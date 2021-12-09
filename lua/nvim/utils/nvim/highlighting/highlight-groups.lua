local function HighlightGroups(highlights)
    local highlight_groups = {}

    for name, colors in pairs(highlights) do
        highlight_groups[name] = {
            name = name,
            colors = colors,
        }
    end

    return highlight_groups
end

return HighlightGroups
