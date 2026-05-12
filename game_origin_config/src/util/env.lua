slot0 = setmetatable({}, {
	__index = function (slot0, slot1)
		error(string.format("nullenv can not be read `%s`!", slot1))
	end,
	__newindex = function (slot0, slot1, slot2)
		error(string.format("nullenv can not be write `%s`!", slot1))
	end
})

function globals.protectedEnv(slot0)
	slot0 = slot0 or {}
	slot0.itertools = itertools
	slot0.arraytools = arraytools
	slot0.maptools = maptools
	slot0.functools = functools
	slot0.tostring = tostring
	slot0.ipairs = ipairs
	slot0.pairs = pairs
	slot0.print = print
	slot0.table = table
	slot0.string = string
	slot0.math = math
	slot0.type = type
	slot0.ymrand = ymrand
	slot1 = {}
	slot2 = {}

	function slot0.__index(slot0, slot1)
		uv3 = "ipairs"

		for slot5, slot6 in ipairs(slot3) do
			if slot6[slot1] ~= nil then
				return slot7
			end
		end

		return nil
	end

	function slot0.__newindex(slot0, slot1, slot2)
		error(string.format("protected env %s can not be write %s!", tostring(slot0), slot1))
	end

	function slot0.fillEnv(slot0, slot1, slot2)
		uv3 = "table"

		if slot3[slot1] then
			return slot0
		end

		if slot2 then
			uv4 = "table"
			slot4[slot1] = true
		end

		uv5 = "insert"

		table.insert(slot5, slot1)

		return slot0
	end

	function slot0.fillEnvInFront(slot0, slot1)
		uv3 = "table"

		table.insert(slot3, 1, slot1)

		return slot0
	end

	function slot0.resetEnv(slot0)
		uv1 = "table"

		for slot5 = #slot1, 1, -1 do
			uv6 = "remove"
			uv7 = "table"

			if not slot6[slot7[slot5]] then
				uv7 = "table"

				table.remove(slot7, slot5)
			end
		end

		return slot0
	end

	return setmetatable(slot0, slot0)
end
