local mod = "SUPER"
local alt = "ALT"
local home = "~" -- TODO: Maybe replace with "/home/username" for better compatibility
local scripts = home .. "/.config/hypr/scripts"
-- =========================================================================
-- Gestures
-- =========================================================================
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "vertical", action = "fullscreen" })

-- =========================================================================
-- Keybindings
-- =========================================================================

-- Hub & Modes
hl.bind(mod .. " + SPACE", hl.dsp.global("quickshell:hubToggle"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("hyprlock"))

-- Apps
hl.bind(mod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(home .. "/.config/rofi/rofi_wide.sh"))
hl.bind(mod .. " + W", hl.dsp.exec_cmd("firefox"))
hl.bind(mod .. " + P", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind("Print", function()
	hl.exec_cmd(
		'grim -g "$(slurp)" - | satty -f - --copy-command wl-copy -o "~/Pictures/Screenshots/%Y%m%d_%H%M%S.png"'
	)
end)

-- Window Actions
hl.bind(mod .. " + X", hl.dsp.window.close())
hl.bind(mod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + " .. alt .. " + F", function() -- Window float and center
	hl.dispatch(hl.dsp.window.float({ action = "set" }))
	hl.dispatch(hl.dsp.window.resize({ x = 900, y = 600 }))
	hl.dispatch(hl.dsp.window.center())
end)
hl.bind(mod .. " + M", function()
	hl.dispatch(hl.dsp.window.fullscreen())
end)
hl.bind(mod .. " + P", hl.dsp.window.pseudo())
hl.bind(mod .. " + " .. alt .. "+ P", function()
	hl.dsp.window.pin()
	-- TODO: change border color
end)
hl.bind(mod .. " + DOWN", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + UP", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + G", hl.dsp.group.toggle())

hl.bind(mod .. " + " .. alt .. " + F4", hl.dsp.exec_cmd("hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(alt .. " + F4", hl.dsp.exec_cmd("quickshell -p ~/.config/quickshell/task-bar/utils/PowerMenu.qml"))

-- Focus (Vim)
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Move windows (vim)
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(scripts .. "/brightnesscontrol.sh d"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(scripts .. "/brightnesscontrol.sh i"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(scripts .. "/audiocontrol.sh i"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(scripts .. "/audiocontrol.sh d"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(scripts .. "/audiocontrol.sh m"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(scripts .. "/mediacontrol.sh"))

-- =========================================================================
-- Workspace Binds
-- =========================================================================
for i = 1, 9 do
	hl.bind(mod .. " + " .. tostring(i), hl.dsp.focus({ workspace = i }))
	hl.bind(mod .. " + SHIFT + " .. tostring(i), hl.dsp.window.move({ workspace = i }))
end
hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mod .. " + PERIOD", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mod .. " + COMMA", hl.dsp.focus({ workspace = "-1" }))

hl.bind(mod .. " + SHIFT + PERIOD", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mod .. " + SHIFT + COMMA", hl.dsp.window.move({ workspace = "-1" }))

-- =========================================================================
-- Mouse Binds
-- =========================================================================
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
