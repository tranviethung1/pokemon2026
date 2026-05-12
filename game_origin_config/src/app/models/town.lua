slot1 = class("Town", require("app.models.base"))

function slot2(slot0)
	if slot0.buildings and slot0.buildings[1] and itertools.size(gTownBuildingCsv[1]) < slot0.buildings[1].level then
		slot0.buildings[1].level = slot1
	end
end

function slot1.init(slot0, slot1)
	uv3 = "_db"

	slot3(slot1._db or slot1._mem or {})

	uv3 = "_mem"

	slot3.init(slot0, slot1)

	return slot0
end

function slot1.syncFrom(slot0, slot1, slot2)
	uv3 = "syncFrom"

	slot3(slot1)

	uv3 = "syncFrom"

	slot3.syncFrom(slot0, slot1, slot2)
end

return slot1
