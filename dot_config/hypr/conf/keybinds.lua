local mod = "SUPER"
local alt = "ALT"
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

-- Apps
hl.bind(mod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(home .. "/.config/rofi/rofi_wide.sh"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mod .. " + P", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mod .. " + S", hl.dsp.exec_cmd("lens --no-decorations --sniper"))

-- Window Actions
hl.bind(mod .. " + X", hl.dsp.window.close())
hl.bind(mod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + " .. alt .. " + F", function()
	hl.dispatch(hl.dsp.window.float({ action = "set" }))
	hl.dispatch(hl.dsp.window.resize({ x = 900, y = 600 }))
	hl.dispatch(hl.dsp.window.center())
end)
hl.bind(mod .. " + M", function()
	hl.dispatch(hl.dsp.window.fullscreen())
end)
hl.bind(mod .. " + P", hl.dsp.window.pseudo())
hl.bind(mod .. " + DOWN", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + UP", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + G", hl.dsp.group.toggle())

hl.bind(mod .. " + L", function()
	hl.dispatch(hl.dsp.window.float({ action = "set" }))
	hl.dispatch(hl.dsp.window.resize_pixel({ exact = true, x = 1440, y = 1080 }))
end)

hl.bind(mod .. " + CTRL + left", function()
	hl.dispatch(hl.dsp.group.change_active({ direction = "next" }))
end)
hl.bind(mod .. " + CTRL + right", function()
	hl.dispatch(hl.dsp.group.change_active({ direction = "prev" }))
end)

hl.bind(mod .. " + " .. alt .. " + F4", hl.dsp.exec_cmd("hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(alt .. " + F4", hl.dsp.exec_cmd("quickshell -p ~/.config/quickshell/task-bar/utils/PowerMenu.qml"))

hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + SHIFT + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + SHIFT + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mod .. " + H", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(scripts .. "/brightnesscontrol.sh d"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(scripts .. "/brightnesscontrol.sh i"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(scripts .. "/audiocontrol.sh i"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(scripts .. "/audiocontrol.sh d"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(scripts .. "/audiocontrol.sh m"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(scripts .. "/mediacontrol.sh"))

hl.bind("Print", hl.dsp.exec_cmd(scripts .. "/screenshot.sh s"))
hl.bind(mod .. " + Print", hl.dsp.exec_cmd(scripts .. "/screenshot.sh p"))
hl.bind(mod .. " + SHIFT + Print", hl.dsp.exec_cmd(scripts .. "/screenshot.sh sf"))
hl.bind(mod .. " + O", hl.dsp.exec_cmd(scripts .. "/screenshot.sh m"))

-- =========================================================================
-- Workspace Binds
-- =========================================================================
for i = 1, 9 do
	hl.bind(mod .. " + " .. tostring(i), hl.dsp.focus({ workspace = i }))
	hl.bind(mod .. " + SHIFT + " .. tostring(i), hl.dsp.window.move({ workspace = i }))
end
hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- =========================================================================
-- Mouse Binds
-- =========================================================================
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
