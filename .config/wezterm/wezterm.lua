local wezterm = require("wezterm")

local config = {}

-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings

config.color_scheme = "rose-pine"

-- Solarized Osaka Colorscheme
-- config.colors = {
-- 	foreground = "#839495", -- color.fg
-- 	background = "#00141a", -- color.base04
--
-- 	cursor_bg = "#839495",
-- 	cursor_border = "#839495",
-- 	cursor_fg = "#00141a",
-- 	selection_bg = "#283457",
-- 	selection_fg = "#839495",
--
-- 	ansi = {
-- 		"#00141a", -- black (color.base04)
-- 		"#dc312e", -- red
-- 		"#859900", -- green
-- 		"#b38600", -- yellow
-- 		"#278bd3", -- blue
-- 		"#d33682", -- magenta
-- 		"#2aa298", -- cyan
-- 		"#ede7d4", -- white (color.base2)
-- 	},
--
-- 	brights = {
-- 		"#002d38", -- black (color.base03)
-- 		"#f65351", -- red300
-- 		"#b7fa00", -- green300
-- 		"#ffbf00", -- yellow300
-- 		"#47adf5", -- blue300
-- 		"#f254a1", -- magenta300
-- 		"#2beede", -- cyan300
-- 		"#fdf6e2", -- white (color.base3)
-- 	},
-- }

-- fonts

config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
})
config.font_size = 16

-- Window

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.macos_window_background_blur = 17
config.window_background_opacity = 1.0

config.initial_rows = 38
config.initial_cols = 136

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- Commands

config.keys = {
	{
		key = "f",
		mods = "CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

return config
