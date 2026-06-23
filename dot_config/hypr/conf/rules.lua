-- =========================================================================
-- Window Rules
-- =========================================================================
hl.window_rule({
	match = { class = "^kitty$" },
	float = true,
	size = "700 400",
	center = true,
	rounding = 8,
	opacity = "0.9 0.9",
})
hl.window_rule({ match = { class = "^org.pwmt.zathura$" }, float = true, size = "750 1000" })
hl.window_rule({
	match = { class = "^blueman-manager$" },
	float = true,
	size = "500 300",
	move = "1165 777",
	rounding = 10,
	opacity = "0.90 0.90",
	border_size = 1,
	border_color = "rgb(87b158) rgb(2D353B)",
	animation = "popin",
	dim_around = true,
})
hl.window_rule({
	match = { class = "^nm-connection-editor$" },
	float = true,
	size = "500 600",
	center = true,
	rounding = 10,
	opacity = "0.95 0.95",
	border_color = "rgb(87b158)",
})
hl.window_rule({
	match = { class = "^com.snes.evercal$" },
	float = true,
	size = "1000 650",
	center = true,
	border_size = 1,
	rounding = 8,
})
hl.window_rule({ match = { class = "^org.gnome.Lollypop$" }, float = true, size = "900 600" })
hl.window_rule({ match = { class = "^org.kde.plasma-systemmonitor$" }, float = true, size = "1000 700", rounding = 14 })
hl.window_rule({
	match = { class = "^lens$" },
	float = true,
	center = true,
	size = "1000 700",
	rounding = 10,
	border_color = "rgb(374527)",
})
hl.window_rule({ match = { class = "^code$" }, opacity = "0.9 0.9" })
hl.window_rule({ match = { class = "^thunar$" }, float = true, opacity = "0.9 0.9", size = "900 600", center = true })
hl.window_rule({
	match = { class = "^xdm-app$" },
	float = true,
	size = "700 400",
	rounding = 10,
	opacity = "0.8 0.8",
	center = true,
})
hl.window_rule({
	match = { class = "^org.gnome.FileRoller$" },
	float = true,
	size = "500 350",
	center = true,
	rounding = 10,
	border_color = "rgb(87b158)",
})
hl.window_rule({
	match = { class = "^com.snes.nowplaying$" },
	float = true,
	pin = true,
	border_size = 1,
	border_color = "rgb(1e2327)",
	animation = "slide",
	move = "1425 16",
	opacity = "0.9 0.9",
})
hl.window_rule({ match = { class = "^xdg-desktop-portal-gtk$" }, float = true, center = true, size = "700 400" })

local portals = {
	"^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland|org.freedesktop.impl.portal.desktop.gtk|org.freedesktop.impl.portal.desktop.kde)$",
	"^(org.kde.polkit-kde-authentication-agent-1|polkit-gnome-authentication-agent-1|lxqt-policykit-agent|mate-polkit)$",
	"^(pinentry|pinentry-gtk-2|pinentry-gnome3|gcr-prompter)$",
	"^(ssh-askpass|sshaskpass)$",
}
for _, p in ipairs(portals) do
	hl.window_rule({ match = { class = p }, tag = "portal-ui" })
end
hl.window_rule({
	match = { tag = "portal-ui" },
	float = true,
	center = true,
	rounding = 10,
	size = "1100 750",
	dim_around = true,
	opacity = "0.95 0.95",
})

local dialog_titles = {
	"^(Open File)(.*)$",
	"^(Select a File)(.*)$",
	"^(Choose wallpaper)(.*)$",
	"^(Open Folder)(.*)$",
	"^(Save As)(.*)$",
	"^(Library)(.*)$",
	"^(File Upload)(.*)$",
	"^(Extract archive)$",
	"^(Extract)(.*)$",
	"^(Extract to)$",
	"^(Confirm to replace files)$",
	"^(Rename)(.*)$",
	"^(Create New Folder)$",
	"^(Properties)$",
	"^(File Operation Progress)(.*)$",
}
for _, t in ipairs(dialog_titles) do
	hl.window_rule({ match = { title = t }, float = true, center = true })
end

local dim_dialogs = { "^(Open File)(.*)$", "^(Save As)(.*)$", "^(Confirm to replace files)$" }
for _, t in ipairs(dim_dialogs) do
	hl.window_rule({ match = { title = t }, dim_around = true })
end

hl.window_rule({ match = { title = "^(Open File)(.*)$" }, size = "900 600" })
hl.window_rule({ match = { title = "^(Save As)(.*)$" }, size = "900 600" })
hl.window_rule({ match = { title = "^(File Upload)(.*)$" }, size = "900 600" })
hl.window_rule({ match = { title = "^(Confirm to replace files)$" }, size = "500 300" })
hl.window_rule({ match = { title = "^(File Operation Progress)(.*)$" }, size = "500 300" })
hl.window_rule({ match = { title = "^(Rename)(.*)$" }, size = "450 200" })
hl.window_rule({ match = { title = "^(Create New Folder)$" }, size = "450 200" })
hl.window_rule({ match = { title = "^(Properties)$" }, size = "500 600" })
hl.window_rule({ match = { modal = true }, float = true, center = true, rounding = 10 })
