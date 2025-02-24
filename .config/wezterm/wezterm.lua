local wezterm = require("wezterm")
local one_dark = require("theme")
local act = wezterm.action

local config = wezterm.config_builder()

config.animation_fps = 60
config.color_schemes = {
	["one_dark"] = one_dark,
}
config.color_scheme = "one_dark"

config.font = wezterm.font("MesloLGS NF")
config.font_size = 14.5

config.cursor_thickness = "200%"
config.force_reverse_video_cursor = true

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.window_background_opacity = 0.5

config.window_frame = {
	font = wezterm.font("MesloLGS NF"),
}

config.window_padding = {
	left = "3pt",
	right = "3pt",
	top = "3pt",
	bottom = "3pt",
}


config.keys = {
  -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = act.SendKey {
      key = 'b',
      mods = 'ALT',
    },
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = act.SendKey { key = 'f', mods = 'ALT' },
  },
}

config.launch_menu = {
	{
		label = "btop",
		args = { "btop" },
	},
	{
		label = "Bash",
		args = { "bash", "-l" },
	},
}

config.window_decorations = "RESIZE"
config.macos_window_background_blur = 20

return config
