slot1 = AutoChessCsv.newCsvCls("CsvScene")
AutoChessCsv.CsvScene = slot1

function slot1.inBattle(slot0)
	return slot0.model.isRunning
end

function slot1.countObjByNature(slot0, slot1, slot2)
	for slot8, slot9 in slot0.model:getHerosMap(slot1):order_pairs() do
		if slot9:hasNature(slot2) then
			slot4 = 0 + 1
		end
	end

	return slot4
end

slot2 = {
	all = function ()
		return true
	end,
	nature = function (slot0, slot1)
		for slot5, slot6 in ipairs(slot1) do
			if slot0:hasNature(slot6) then
				return true
			end

			return false
		end
	end,
	group = function (slot0, slot1)
		for slot5, slot6 in ipairs(slot1) do
			if slot0:hasBuffGroup(slot6) then
				return true
			end
		end

		return false
	end,
	buff = function (slot0, slot1)
		for slot5, slot6 in ipairs(slot1) do
			if slot0:hasBuff(slot6) then
				return true
			end
		end

		return false
	end,
	unitID = function (slot0, slot1)
		for slot5, slot6 in ipairs(slot1) do
			if slot0.unitCfg.id == slot6 then
				return true
			end
		end

		return false
	end,
	star = function (slot0, slot1)
		for slot5, slot6 in ipairs(slot1) do
			if slot0:getStar() == slot6 then
				return true
			end
		end

		return false
	end,
	equiped = function (slot0, slot1)
		for slot5, slot6 in ipairs(slot1) do
			if slot0:getEquipmentNum() == slot6 then
				return true
			end
		end

		return false
	end
}

function slot1.countObj(slot0, slot1, slot2, slot3)
	uv4 = "model"

	if not slot4[slot1] then
		return 0
	end

	slot5 = 0

	if slot2 == 1 or slot2 == 2 then
		for slot10, slot11 in slot0.model:getHerosMap(slot2):order_pairs() do
			if slot4(slot11, slot3) then
				slot5 = slot5 + 1
			end
		end
	elseif slot2 == 3 then
		for slot9, slot10 in ipairs(slot0.model.handCards) do
			if slot4(slot10, slot3) then
				slot5 = slot5 + 1
			end
		end
	end

	return slot5
end

function slot1.randomCards(slot0, slot1, slot2, slot3, slot4)
	return AutoChessEasy.randomCards(slot0.model, slot1, slot2, slot3, slot4)
end

AutoChessCsv.exportToCsvCls(slot1, {
	getGoldNum = 0
})
