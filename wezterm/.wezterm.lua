-- Wezter API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 24
config.initial_cols = 91
config.initial_rows = 52

config.enable_tab_bar = false

config.window_decorations = "NONE" -- "TITLE | RESIZE" or "TITLE | NONE" or "NONE"

config.color_scheme = "tokyonight_night"

-- config.colors = {
-- 	foreground = "#CBE0F0",
-- 	background = "#011423",
-- 	cursor_bg = "#66B2B2",
-- 	cursor_border = "#66B2B2",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#033259",
-- 	selection_fg = "#CBE0F0",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }

config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

config.default_prog = { "/bin/bash", "-l" }

return config
