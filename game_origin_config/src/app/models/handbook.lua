slot1 = class("Handbook", require("app.models.base"))

function slot1.init(slot0, slot1)
	if slot1._db and slot1._db.pokedex then
		-- Nothing
	end

	slot0.__idlers = idlers.newWithMap({
		isNew = idlereasy.new(false, "isNew")
	}, tostring(slot0))

	return slot0
end

function slot1.syncFrom(slot0, slot1, slot2)
	slot3 = slot2 or {}

	if slot1._db and slot1._db.pokedex then
		slot0:getRawIdler_("isNew"):set(true)
	end
end

function slot1.getIdlerOrigin(slot0, slot1)
	return slot0:getOrNewRawIdler_(slot1)
end

function slot1.syncDel(slot0, slot1)
	if slot1._db and slot1._db.pokedex then
		slot0:getRawIdler_("isNew"):set(false)
	end
end

return slot1
