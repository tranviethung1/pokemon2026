slot0 = class("CurrLoginDispatch", require("app.models.base"))

function slot0.init(slot0, slot1)
	for slot6, slot7 in pairs(slot1) do
		-- Nothing
	end

	slot0.__idlers = idlers.newWithMap({
		[slot6] = idlereasy.new(slot7, slot6)
	}, tostring(slot0))

	return slot0
end

function slot0.getIdlerOrigin(slot0, slot1)
	return slot0:getOrNewRawIdler_(slot1)
end

return slot0
