local wezterm = require "wezterm";

return {
	font = wezterm.font("Myrica M"),
	font_size = 14,

	skip_close_confirmation_for_processes_named = {""},

	disable_default_key_bindings = true,

	leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		{key = "Enter", mods = "ALT", action = "ToggleFullScreen"},

		{key = "-", mods = "ALT", action = "DecreaseFontSize"},
		{key = "=", mods = "ALT", action = "IncreaseFontSize"},
		{key = "0", mods = "ALT", action = "ResetFontSize"},

		{key = "r", mods = "ALT", action = "ReloadConfiguration"},

		{key = "c", mods = "CTRL|SHIFT", action = wezterm.action{
			CopyTo = "Clipboard"
		}},
		{key = "v", mods = "CTRL|SHIFT", action = wezterm.action{
			PasteFrom = "Clipboard"
		}},
		{key = "[", mods = "LEADER", action = "ActivateCopyMode"},

		{key = "v", mods = "LEADER", action = wezterm.action{
			SplitHorizontal = { domain = "CurrentPaneDomain" }
		}},
		{key = "x", mods = "LEADER", action = wezterm.action{
			CloseCurrentPane = {confirm = true}
		}},

		{key = "s", mods = "LEADER", action = "QuickSelect"},

		{key = "h", mods = "LEADER", action = wezterm.action{
			ActivatePaneDirection = "Left"
		}},
		{key = "j", mods = "LEADER", action = wezterm.action{
			ActivatePaneDirection = "Down"
		}},
		{key = "k", mods = "LEADER", action = wezterm.action{
			ActivatePaneDirection = "Up"
		}},
		{key = "l", mods = "LEADER", action = wezterm.action{
			ActivatePaneDirection = "Right"
		}},
		{key = "h", mods = "ALT", action = wezterm.action{
			AdjustPaneSize = {"Left", 1}
		}},
		{key = "j", mods = "ALT", action = wezterm.action{
			AdjustPaneSize = {"Down", 1}
		}},
		{key = "k", mods = "ALT", action = wezterm.action{
			AdjustPaneSize = {"Up", 1}
		}},
		{key = "l", mods = "ALT", action = wezterm.action{
			AdjustPaneSize = {"Right", 1}
		}},
		{key = "o", mods = "LEADER", action = "TogglePaneZoomState"},

		{key = "t", mods = "LEADER", action = wezterm.action{
			SpawnTab = "CurrentPaneDomain"
		}},
		{key = "T", mods = "LEADER|SHIFT", action = wezterm.action{
			SpawnTab = "DefaultDomain"
		}},

		{key = "n", mods = "ALT", action = wezterm.action{
			ActivateTabRelative = 1
		}},
		{key = "p", mods = "ALT", action = wezterm.action{
			ActivateTabRelative = -1
		}},
		{key = "1", mods = "ALT", action = wezterm.action{
			ActivateTab = 0
		}},
		{key = "2", mods = "ALT", action = wezterm.action{
			ActivateTab = 1
		}},
		{key = "3", mods = "ALT", action = wezterm.action{
			ActivateTab = 2
		}},
		{key = "4", mods = "ALT", action = wezterm.action{
			ActivateTab = 3
		}},
		{key = "5", mods = "ALT", action = wezterm.action{
			ActivateTab = 4
		}},
		{key = "6", mods = "ALT", action = wezterm.action{
			ActivateTab = 5
		}},
		{key = "7", mods = "ALT", action = wezterm.action{
			ActivateTab = 6
		}},
		{key = "8", mods = "ALT", action = wezterm.action{
			ActivateTab = 7
		}},
		{key = "9", mods = "ALT", action = wezterm.action{
			ActivateTab = 8
		}},

		{key = "n", mods = "LEADER", action = wezterm.action{
			ActivateTabRelative = 1
		}},
		{key = "p", mods = "LEADER", action = wezterm.action{
			ActivateTabRelative = -1
		}},
		{key = "1", mods = "LEADER", action = wezterm.action{
			ActivateTab = 0
		}},
		{key = "2", mods = "LEADER", action = wezterm.action{
			ActivateTab = 1
		}},
		{key = "3", mods = "LEADER", action = wezterm.action{
			ActivateTab = 2
		}},
		{key = "4", mods = "LEADER", action = wezterm.action{
			ActivateTab = 3
		}},
		{key = "5", mods = "LEADER", action = wezterm.action{
			ActivateTab = 4
		}},
		{key = "6", mods = "LEADER", action = wezterm.action{
			ActivateTab = 5
		}},
		{key = "7", mods = "LEADER", action = wezterm.action{
			ActivateTab = 6
		}},
		{key = "8", mods = "LEADER", action = wezterm.action{
			ActivateTab = 7
		}},
		{key = "9", mods = "LEADER", action = wezterm.action{
			ActivateTab = 8
		}},

		{key = "f", mods = "ALT", action = wezterm.action{
			ScrollByPage = 1
		}},
		{key = "b", mods = "ALT", action = wezterm.action{
			ScrollByPage = -1,
		}},
		{key = "d", mods = "ALT", action = wezterm.action{
			ScrollByLine = 30
		}},
		{key = "u", mods = "ALT", action = wezterm.action{
			ScrollByLine = -30,
		}},
		{key = "e", mods = "ALT", action = wezterm.action{
			ScrollByLine = 1
		}},
		{key = "y", mods = "ALT", action = wezterm.action{
			ScrollByLine = -1,
		}},
		{key = "G", mods = "ALT|SHIFT", action = "ScrollToBottom"},

		{key = "f", mods = "LEADER", action = wezterm.action{
			Search = {
				CaseSensitiveString = ""
			}
		}},
	}
}
