local wibox = require("wibox")
local awful = require("awful")

local widget = wibox.widget.textbox()

local function update()
	awful.spawn.easy_async("pamixer --get-volume-human", function(stdout)
		widget.text = "VOL: " .. stdout
	end)
end

local function change(number)
	if number < 0 then
		awful.spawn("pamixer -d " .. math.abs(number))
	else
		awful.spawn("pamixer -i " .. math.abs(number))
	end
	update()
end

widget:connect_signal("button::press", function(self, lx, ly, button)
	if button == 4 then
		change(5)
	elseif button == 5 then
		change(-5)
	elseif button == 1 then
		awful.spawn("pamixer -t")
		update()
	elseif button == 3 then
		awful.spawn("pavucontrol-qt")
	end
end)

update()

local widget_timer = timer({ timeout = 5 })
widget_timer:connect_signal("timeout", function()
	update()
end)
widget_timer:start()

return {
	widget = widget,
	change = change,
}
