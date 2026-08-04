-- =========================================================================
-- @snes19xx · Hyprland 0.55 CONFIG
-- =========================================================================

-- home = os.getenv("HOME") or "/home/fabio-hypr/"
local home = "/home/fabio-hypr/"
local scripts = home .. "/.config/hypr/scripts"

-- Import Shader Manager and Inject Core
-- local shader = require("shader") # TODO: maybe readd

-- =========================================================================
-- Monitors
-- =========================================================================
hl.monitor({
	output = "eDP-1",
	mode = "2560x1600@60",
	position = "0x0",
	scale = 1.33,
})
hl.monitor({ output = "", mode = "preferred", position = "auto-up", scale = 1 })

-- =========================================================================
-- Environment Variables
-- =========================================================================
-- hl.env("HYPRCURSOR_SIZE", "48")
-- hl.env("XCURSOR_THEME", "volantes_cursors")
-- hl.env("XCURSOR_SIZE", "48")
-- hl.env("GDK_SCALE", "2")
-- hl.env("GDK_BACKEND", "wayland,x11,*")
-- hl.env("CLUTTER_BACKEND", "wayland")
hl.env("TERMINAL", "kitty")
hl.env("EDITOR", "nvim")
-- hl.env("QT_QPA_PLATFORMTHEME", "kde")
-- hl.env("QT_STYLE_OVERRIDE", "kvantum")
-- hl.env("QT_QPA_PLATFORM", "wayland;xcb")

-- =========================================================================
-- Autostart
-- =========================================================================
hl.on("hyprland.start", function()
	-- 	hl.exec_cmd("sleep 1 && mpv --no-video --volume=100 " .. home .. "/.config/hypr/sounds/startup.wav")
	-- 	shader.toggle("Main")
	hl.exec_cmd("dunst")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("qs -c top-bar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
end)

-- =========================================================================
-- Core Config
-- =========================================================================
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 1,
		["col.active_border"] = "rgba(87b158aa)",
		["col.inactive_border"] = "rgba(595959aa)",
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 7,
		active_opacity = 1.0,
		inactive_opacity = 0.9,
		dim_inactive = false,
		dim_strength = 0.19,
		dim_around = 0.6,
		shadow = {
			enabled = true,
			range = 3,
			render_power = 17,
			color = "rgba(44220044)",
		},
		blur = {
			enabled = true,
			size = 5,
			passes = 4,
			new_optimizations = true,
			xray = true,
			popups = true,
		},
	},
	animations = {
		enabled = true,
	},
	dwindle = {
		preserve_split = true,
		smart_resizing = true,
	},
	master = {
		new_status = "master",
	},
	group = {
		["col.border_active"] = "rgba(00000000)",
		["col.border_inactive"] = "rgba(00000000)",
		groupbar = {
			enabled = true,
			height = 16,
			gradients = true,
			["col.active"] = "rgb(87b158)",
			["col.inactive"] = "rgba(2D353Bff)",
			keep_upper_gap = false,
			indicator_height = 0,
			indicator_gap = 0,
			gaps_in = 0,
			gaps_out = 9,
			gradient_rounding = 8,
			font_family = "Inter",
			font_size = 11,
			font_weight_active = "medium",
			font_weight_inactive = "medium",
			text_color = "rgb(293136)",
			text_color_inactive = "rgba(e5e6c5ff)",
			text_offset = 1,
		},
	},
	input = {
		kb_layout = "ch",
		kb_model = "pc104",
		follow_mouse = 1,
		sensitivity = 0.3,
		accel_profile = "flat",
		repeat_rate = 50,
		repeat_delay = 500,
		touchpad = {
			scroll_factor = 0.3,
			natural_scroll = true,
			disable_while_typing = true,
		},
	},
	xwayland = {
		force_zero_scaling = true,
	},
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		force_default_wallpaper = 0,
		animate_manual_resizes = true,
		enable_swallow = true,
		swallow_regex = "^(kitty)$",
	},
	layerrule = {
		"animation slide, rofi",
		"animation popin, power-menu",
		"dim_around, power-menu",
	},
})
--
-- -- =========================================================================
-- -- Lid Switch
-- -- =========================================================================
-- hl.bind("switch:off:Lid Switch", function()
-- 	hl.timer(function()
-- 		hl.dispatch(hl.dsp.exec_cmd("hyprctl dispatch dpms on eDP-1"))
-- 	end, { timeout = 500, type = "oneshot" })
-- end, { locked = true })
-- hl.bind("switch:on:Lid Switch", function()
-- 	hl.timer(function()
-- 		hl.dispatch(hl.dsp.exec_cmd("hyprctl dispatch dpms off eDP-1"))
-- 	end, { locked = true })
-- end, { locked = true })

require("conf.keybinds")
require("conf.animations")
require("conf.rules")
