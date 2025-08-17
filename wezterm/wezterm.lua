local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- @param: path(string): path to cut
local function get_lowest_dirs(path)
    path = path:gsub('/$', '')

    local parts = {}
    for part in string.gmatch(path, '[^/]+') do
        table.insert(parts, part)
    end

    local count = #parts
    if count <= 2 then
        return path
    end
    return parts[count - 1] .. '/' .. parts[count]
end

config.initial_cols = 120
config.initial_rows = 28
config.font_size = 14
config.color_scheme = 'tokyonight'
config.default_prog = { '/usr/local/bin/tmux' }

wezterm.on('format-tab-title', function(tab, tabs, config, hover, max_width)
    local pane = tab.active_pane
    local title = pane.title or '?'
    if string.sub(title, 1, 1) == '/' then
        title = get_lowest_dirs(title)
    end

    return {
        { Text = title },
    }
end)

return config
