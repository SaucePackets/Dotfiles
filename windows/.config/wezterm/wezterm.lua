local wezterm = require("wezterm")
local mux = wezterm.mux
local action = wezterm.action

local config = wezterm.config_builder()
local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

config.font = wezterm.font_with_fallback({
  "JetBrainsMono Nerd Font",
	"JetBrains Mono",
})
config.font_size = 14

-- Set PWSH as the default for Windows
config.default_prog = { 'pwsh.exe', '-NoLogo' }

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "CTRL|SHIFT" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "CTRL|SHIFT" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 5 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

config.window_decorations = "RESIZE"
config.window_frame = {
	font_size = 13.0,
}
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.show_new_tab_button_in_tab_bar = false
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

config.color_scheme = "Catppuccin Mocha"

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.warn_about_missing_glyphs = false

config.keys = {

	{ key = "l", mods = "ALT", action = wezterm.action.ShowLauncher },
	{
		key = "|",
		mods = "LEADER",
		action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "z",
		mods = "LEADER",
		action = action.TogglePaneZoomState,
	},
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},

	{
		key = "p",
		mods = "LEADER",
		action = action.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "LEADER",
		action = action.ActivateTabRelative(1),
	},
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{
		key = "a",
		mods = "LEADER|CTRL",
		action = action.SendKey({ key = "a", mods = "CTRL" }),
	},
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),
	{
		key = "W",
		mods = "CTRL|SHIFT",
		action = action.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						action.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
}
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = action.ActivateTab(i - 1),
	})
end

config.status_update_interval = 10000

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup({
	sections = {
		tabline_x = "",
		tabline_y = "",
		tab_active = { "index", { "process", padding = { left = 0, right = 1 } } },
	},
	options = {
		section_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thick,
			right = wezterm.nerdfonts.ple_left_half_circle_thick,
		},
		component_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thin,
			right = wezterm.nerdfonts.ple_left_half_circle_thin,
		},
		tab_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thick,
			right = wezterm.nerdfonts.ple_left_half_circle_thick,
		},
		color_overrides = {
			normal_mode = {
				a = { fg = "#2d353b", bg = "#a7c080" },
				b = { fg = "#a7c080", bg = "#42494e" },
				c = { fg = "#d3c6aa", bg = "#2d353b" },
			},
			copy_mode = {
				a = { fg = "#2d353b", bg = "#dbbc7f" },
				b = { fg = "#dbbc7f", bg = "#42494e" },
				c = { fg = "#d3c6aa", bg = "#2d353b" },
			},
			search_mode = {
				a = { fg = "#2d353b", bg = "#7fbbb3" },
				b = { fg = "#7fbbb3", bg = "#42494e" },
				c = { fg = "#d3c6aa", bg = "#2d353b" },
			},
			tab = {
				active = { fg = "#7fbbb3", bg = "#42494e" },
				inactive = { fg = "#d3c6aa", bg = "#2d353b" },
				inactive_hover = { fg = "#d699b6", bg = "#42494e" },
			},
			scheme = {
				foreground = "#d3c6aa",
				background = "#2d353b",
				cursor_fg = "#2d353b",
				cursor_bg = "#d3c6aa",
				cursor_border = "#d3c6aa",
				ansi = {
					"#4b565c",
					"#e67e80",
					"#a7c080",
					"#dbbc7f",
					"#7fbbb3",
					"#d699b6",
					"#83c092",
					"#d3c6aa",
				},
				brights = {
					"#5c6a72",
					"#f85552",
					"#8da101",
					"#dfa000",
					"#3a94c5",
					"#df69ba",
					"#35a77c",
					"#dfddc8",
				},
			},
		},
	},
})

return config
