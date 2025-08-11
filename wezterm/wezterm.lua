local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28
config.font_size = 14
config.color_scheme = "tokyonight"
config.default_prog = { "/usr/local/bin/tmux" }

return config
