slot1 = AutoChessCsv.newCsvCls("CsvTrainer")
slot1.ignoreModelCheck = {
	getBuff = true
}
AutoChessCsv.CsvTrainer = slot1

function slot1.hp(slot0)
	return slot0.model:hp()
end

function slot1.team(slot0)
	return slot0.model.team
end

function slot1.getBuff(slot0, slot1)
	if slot0.model then
		if slot0.model:getBuff(slot1) == nil then
			return AutoChessCsv.NilBuff
		end

		if slot2:getCsvObject() == nil then
			AutoChessCsv.CsvBuff.new(slot2)
			assert(slot2:getCsvObject(), "buff csv object was nil")
		end

		return slot2:getCsvObject()
	end

	return AutoChessCsv.NilBuff
end

function slot1.hasBuff(slot0, ...)
	for slot4, slot5 in ipairs({
		...
	}) do
		if slot0.model:hasBuff(slot5) then
			return true
		end
	end

	return false
end

function slot1.hasBuffGroup(slot0, ...)
	for slot4, slot5 in ipairs({
		...
	}) do
		if slot0.model:hasBuffGroup(slot5) then
			return true
		end
	end

	return false
end

function slot1.lostHp(slot0)
	return slot0.model.totalLostHP or 0
end

function slot1.id(slot0)
	return slot0.model.cfg and slot0.model.cfg.id or 0
end

function slot1.skillID(slot0)
	return slot0.model.skillId or 0
end

function slot1.isTrainer(slot0)
	return slot0.model.isTrainer and true or false
end

AutoChessCsv.exportToCsvCls(slot1, {
	getBuffOverlayCount = 0
})
