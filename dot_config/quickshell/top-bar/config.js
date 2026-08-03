.pragma library

// hardcoding just for now.
var PROFILE_IMG = "~/.config/quickshell/snes-hub/profile.jpg"
var PROFILE_NAME = "Fabio"

var TOP_GAP = 50
var RIGHT_GAP = 10
var PANEL_W = 340
var PANEL_H = 600

// Weather
var WEATHER_CACHE_PATH = "~/.config/ags/.cache/ags-weather.json"
var WEATHER_SCRIPT_PATH = "~/.config/ags/script/weather.sh"

// Events
var EVENTS_CMD = "khal list now 1h --json title --json start-time 2>/dev/null || echo '[]'"

// Screenshot
var SNAP_CMD = "command -v grimblast >/dev/null && grimblast --notify copysave area || true"
