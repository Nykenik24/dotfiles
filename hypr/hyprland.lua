--------------------
---- MONITORS   ----
--------------------
hl.monitor({
	output = "DP-2",
	mode = "2560x1440@165",
	position = "auto",
	scale = 1,
	vrr = true,
})

hl.monitor({
	output = "HDMI-A-2",
	mode = "1920x1080@144",
	position = "auto",
	scale = 1,
	vrr = true,
	-- transform = 3,
})

--@diagnostic disable: undefined-global

local terminal = "ghostty"
local fileManager = "thunar"
local menu = "wofi --show drun"
local task = "todoist"
local mainMod = "SUPER"

-- NOTE (ArchWiki): if using uwsm, put env vars in ~/.config/uwsm/env instead.
-- Keeping them here works but uwsm is the recommended approach.
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-----------------------
----- PERMISSIONS -----
-----------------------
hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

local theme = require("colors")

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
	general = {
		allow_tearing = false,
		border_size = 4,
		col = {
			active_border = { colors = { theme.rose, theme.pine, theme.love, theme.iris }, angle = 90 },
			inactive_border = theme.muted,
		},
		gaps_in = 5,
		gaps_out = 10,
		layout = "scrolling",
		resize_on_border = false,
	},

	scrolling = {
		fullscreen_on_one_column = true,
		--column_width = 1,
		wrap_swapcol = false,
	},

	decoration = {
		active_opacity = 1.0,
		inactive_opacity = 0.95,
		rounding = 10,
		blur = {
			enabled = true,
			passes = 1,
			size = 6,
			vibrancy = 0.1696,
		},
		shadow = {
			enabled = true,
			color = "rgba(1a1a1aee)",
			range = 4,
			render_power = 3,
		},
	},

	input = {
		accel_profile = "flat",
		follow_mouse = 1,
		kb_layout = "us,es,pl",
		kb_model = "",
		kb_options = "grp:ctrl_alt_toggle,caps:escape",
		kb_rules = "",
		kb_variant = "",
		sensitivity = -0.4,
		touchpad = {
			natural_scroll = false,
		},
	},

	misc = {
		disable_hyprland_logo = true,
		force_default_wallpaper = -1,
		vrr = 1,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	animations = {
		enabled = true,
	},
})

hl.window_rule({ name = "ghostty_starting_width", match = { class = "ghostty" }, scrolling_width = 0.5 })

local workspaces_per_monitor = 10

local function create_workspaces(monitor)
	for i = 1, workspaces_per_monitor do
		hl.workspace_rule({
			workspace = tostring(monitor.id * workspaces_per_monitor + i),
			monitor = monitor.name,
			persistent = true,
			default = (i == 1),
		})
	end
end

for _, monitor in ipairs(hl.get_monitors()) do
	create_workspaces(monitor)
end

hl.on("monitor.added", create_workspaces)

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())

-- Exit: hyprshutdown if available, else fall back via hyprctl
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

hl.bind(mainMod .. "+ Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(task))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("waybar &"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("killall waybar"))

hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("$HOME/scripts/notesmenu.sh"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("$HOME/scripts/newnote.sh"))
hl.bind(mainMod .. " + ALT + N", hl.dsp.exec_cmd("$HOME/scripts/removenote.sh"))

-- hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
-- hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + left", hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + right", hl.dsp.layout("focus r"))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.layout("colresize 1"))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.layout("colresize 0.5"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.layout("consume_or_expel next"))
hl.bind(mainMod .. " + period", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + comma", hl.dsp.layout("swapcol l"))

-- Workspaces

local function active_monitor_id()
	local monitor = hl.get_active_monitor()
	return monitor and monitor.id or 0
end

local function activate_workspace(number)
	return function()
		local monitor_id = active_monitor_id()
		hl.dispatch(hl.dsp.focus({
			workspace = tostring(monitor_id * workspaces_per_monitor + number),
		}))
	end
end

local function move_to_workspace(number)
	return function()
		local monitor_id = active_monitor_id()
		hl.dispatch(hl.dsp.window.move({
			workspace = tostring(monitor_id * workspaces_per_monitor + number),
			follow = true,
		}))
	end
end

for i = 1, 10 do
	local key = tostring(i % 10)
	hl.bind(mainMod .. " + " .. key, activate_workspace(i))
	hl.bind(mainMod .. " + SHIFT + " .. key, move_to_workspace(i))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media & brightness keys
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar &")
	hl.exec_cmd("waypaper --restore")
	hl.exec_cmd("solaar -w hide &")
	hl.exec_cmd("mpd-discord-rpc &")
	hl.exec_cmd("hl-zed-dc-rpc &")
	hl.exec_cmd("hyprctl setcursor BreezeX-RosePine-Linux 30")
end)

hl.on("config.reloaded", function()
	hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"')
	hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
end)

--------------------
---- ANIMATIONS ----
--------------------
hl.curve("easeInQuint", { type = "bezier", points = { { 0.64, 0 }, { 0.78, 0 } } })
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1.0 }, { 0.32, 1.0 } } })
hl.curve("easeInOutQuint", { type = "bezier", points = { { 0.83, 0 }, { 0.17, 1.0 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1.0 } } })
hl.curve("linear", { type = "bezier", points = { { 0.0, 0.0 }, { 1.0, 1.0 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0.0 }, { 0.1, 1.0 } } })
hl.curve("overshoot", { type = "bezier", points = { { 0.5, 0.9 }, { 0.1, 1.1 } } })
hl.curve("snap", { type = "bezier", points = { { 0.09, 0.57 }, { 0.49, 0.9 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10.0, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "easeInQuint", style = "slide" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4.0, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slidevert" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slidevert" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.2, bezier = "overshoot", style = "slide" })
