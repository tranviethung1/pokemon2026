slot0 = class("GameModelsBase", CMap)

function slot0.ctor(slot0, slot1)
	slot0.game = slot1

	CMap.ctor(slot0)
end

function slot0.init(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot0:find(slot5) ~= nil then
			slot7:syncFrom(slot6)
		else
			slot0:insert(slot5, slot0:newModel(slot6))
		end
	end

	return slot0
end

function slot0.newModel(slot0, slot1)
	error("need be implement!!!")
end

function slot0.getIdler(slot0, slot1, slot2)
	if slot1 == nil then
		error("GameModelsBase not __idlers")
	end

	return slot0:find(slot1):getIdler(slot2)
end

function slot0.syncFrom(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot1) do
		if slot0:find(slot6) ~= nil then
			slot8:syncFrom(slot7, slot2 and slot2[slot6])
		else
			slot0:insert(slot6, slot0:newModel(slot7))
		end
	end
end

function slot0.syncDel(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot6 == false then
			slot0:erase(slot5)
		else
			slot0:find(slot5):syncDel(slot6)
		end
	end
end

return slot0
