-- Brace remap for Command+UIOP
-- Only triggers when Command is held, ignores Shift
local remap = {
	E = "@",
}

local eventtap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
	local flags = event:getFlags()
	local keyCode = event:getKeyCode()
	local char = hs.keycodes.map[keyCode]

	-- Only trigger if Command is down (and no other modifiers)
	if flags.cmd and not (flags.alt or flags.ctrl or flags.fn) then
		local mappedChar = remap[char:upper()]
		if mappedChar then
			hs.eventtap.keyStrokes(mappedChar)
			return true -- stop original key
		end
	end
	return false
end)

eventtap:start()
