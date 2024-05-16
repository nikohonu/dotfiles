local awful = require("awful")
local gears = require("gears")
local vars = require("vars")
local modkey = "Mod4"

return gears.table.join(
	-- run
	awful.key({ modkey }, "r", function()
		awful.spawn(vars.drun)
	end, { description = "drun", group = "run" }),
	awful.key({ modkey, "Shift" }, "r", function()
		awful.spawn(vars.run)
	end, { description = "run", group = "run" }),
	awful.key({ modkey }, "w", function()
		awful.spawn("shiori search")
	end, { description = "bookmark", group = "run" }),
	awful.key({ modkey, "Shift" }, "w", function()
		awful.spawn("shiori tag")
	end, { description = "bookmark tags", group = "run" }),
	-- programs
	awful.key({ modkey }, "q", function()
		awful.spawn(vars.terminal)
	end, { description = "terminal", group = "program" }),
	awful.key({ modkey }, "e", function()
		awful.spawn(vars.file_manager)
	end, { description = "file manager", group = "program" }),
	awful.key({ modkey, "Shift" }, "s", function()
		awful.spawn("screenshot.bash region")
	end, { description = "screenshot region", group = "program" }),
	awful.key({}, "Print", function()
		awful.spawn("screenshot.bash")
	end, { description = "screenshot screen", group = "program" }),
	awful.key({ modkey }, "s", function()
		awful.spawn("screenshot.bash temp")
	end, { description = "screenshot temp", group = "program" }),

	-- MPRIS
	awful.key({modkey}, "p", function()
		awful.spawn("playerctl play-pause")
	end, { description = "MPRIS play-pause", group = "MPRIS" }),
	awful.key({}, "XF86AudioPause", function()
		awful.spawn("playerctl play-pause")
	end, { description = "MPRIS pause", group = "MPRIS" }),
	awful.key({}, "XF86AudioPlay", function()
		awful.spawn("playerctl play-pause")
	end, { description = "MPRIS pause", group = "MPRIS" }),
	awful.key({}, "XF86AudioPrev", function()
		awful.spawn("playerctl previous")
	end, { description = "previous", group = "MPRIS" }),
	awful.key({}, "XF86AudioNext", function()
		awful.spawn("playerctl next")
	end, { description = "next", group = "MPRIS" })
)
