local obj = {}
obj.__index = obj

-- Metadata
obj.name = "At"
obj.version = "0.1"
obj.author = "Afonso Silva"
obj.license = "MIT"

function obj:init()
	local remap = {
		E = "@",
	}

	self.eventtap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
		local flags = event:getFlags()
		local keyCode = event:getKeyCode()
		local char = hs.keycodes.map[keyCode]

		-- Only trigger if Command is down (and no other modifiers)
		if flags.cmd and not (flags.alt or flags.ctrl or flags.fn) then
			local mappedChar = remap[char:upper()]
			if mappedChar then
				hs.eventtap.keyStrokes(mappedChar)
				return true
			end
		end
		return false
	end)
end

function obj:start()
	self.eventtap:start()
end

function obj:stop()
	self.eventtap:stop()
end

return obj
