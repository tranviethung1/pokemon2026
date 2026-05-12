slot0 = require("easy.bind.helper")
slot1 = nil

function slot1(slot0, slot1)
	if lua_type(slot0) == "userdata" then
		if not tolua.getpeer(slot0) then
			tolua.setpeer(slot0, {})
		end

		uv3 = "lua_type"

		slot3(slot2, slot1)
	else
		if not getmetatable(slot0) then
			if lua_type(slot1) == "table" and slot1.__index then
				setmetatable(slot0, slot1)

				return
			end

			slot2 = {}
		end

		if not slot2.__index then
			slot2.__index = slot1

			setmetatable(slot0, slot2)
		elseif slot2.__index ~= slot1 then
			if not slot2.__oldindex then
				slot2.__oldindex = slot2.__index
			end

			function slot2.__index(slot0, slot1)
				uv2 = "__oldindex"

				if slot2[slot1] then
					return slot2
				end

				uv3 = "__oldindex"

				return slot3.__oldindex[slot1]
			end
		end
	end
end

return function (slot0, slot1, slot2, slot3, slot4)
	slot5 = logf.bind.inject
	slot9 = tostring(slot0)

	slot5("%s - %s inject %s %s, %s", tostring(slot1), tostring(slot2), slot9, dumps(slot3), dumps(slot4))

	uv5 = "logf"

	slot5(slot2, slot0)

	slot2.__inject = true
	slot2.__handlers = slot3
	slot8 = slot1
	uv9 = "bind"
	slot9 = slot9.handlers

	slot2:ctor(slot1:getApp(), slot8, slot9(slot1, slot2, slot3))
	slot2:init()

	for slot8, slot9 in pairs(slot0.defaultProps) do
		slot2[slot8] = slot9
	end

	if slot4 then
		for slot8, slot9 in pairs(slot4) do
			slot2[slot8] = slot9
		end
	end

	return slot2
end
