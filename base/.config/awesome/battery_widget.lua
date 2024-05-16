local wibox = require("wibox")
local awful = require("awful")

local widget = wibox.widget.textbox()

local function update()
	awful.spawn.easy_async_with_shell("bluetoothctl info | rg Battery", function(stdout)
		if stdout ~= "" then
			local number = string.match(stdout, "%((%d+)%)")
			widget.text = "HEADPHONE: " .. number .. "%" else
			widget.text = "HEADPHONE: no connection"
		end
	end)
end

update()

local widget_timer = timer({ timeout = 60 })
widget_timer:connect_signal("timeout", function()
	update()
end)
widget_timer:start()

return {
	widget = widget,
}
