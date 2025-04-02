-- pull in the api
local wezterm = require 'wezterm'

--hold the config
local config = wezterm.config_builder()

--set the color scheme
config.color_scheme = 'Catppuccin Macchiato'

--setting the window frame and font sizes
config.window_frame = {
  --set the font size
  font_size = 10,
}

config.window_background_opacity = 0.8

return config
