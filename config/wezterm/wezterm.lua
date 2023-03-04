local wezterm = require 'wezterm'

return {
  -- Font
  font = wezterm.font('CaskaydiaCove Nerd Font') ,
  font_size = 16,

  -- Tab bar
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom= true,
  window_frame = { font = font },

  -- KeyBindings
  disable_default_key_bindings = true,
  keys = {
    { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
    { key = 'r', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'd', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'Tab', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateLastTab },
    { key = "t", mods = 'CTRL|SHIFT', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  },

  -- Starts home-manager managed nix shell.
  default_prog = {"/home/kotuw/.nix-profile/bin/fish", "-l"},

  -- color_scheme = "Nocturnal Winter",
  -- color_scheme = "Dark Pastel",
  -- color_scheme = "carbonfox",
  color_scheme = "DotGov",

  -- Window
  window_padding = {
    left = "2cell",
    right = "2cell",
    top = "1cell",
    bottom = "1cell",
  }, 
  adjust_window_size_when_changing_font_size = false,
  
}
