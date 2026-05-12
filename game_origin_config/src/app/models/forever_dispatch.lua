slot0 = class("ForeverDispatch", require("app.models.base"))

function slot0.init(slot0, slot1)
	slot2 = {
		[slot6] = idlereasy.new(userDefault.getForeverLocalKey(slot6, slot7), slot6)
	}

	for slot6, slot7 in pairs(slot1) do
		idlereasy.when(slot2[slot6], function (slot0, slot1)
			uv3 = "userDefault"

			userDefault.setForeverLocalKey(slot3, slot1)
		end)
	end

	slot0.__idlers = idlers.newWithMap(slot2, tostring(slot0))

	return slot0
end

function slot0.getIdlerOrigin(slot0, slot1)
	return slot0:getOrNewRawIdler_(slot1)
end

return slot0
